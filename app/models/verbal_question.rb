# -*- encoding : utf-8 -*-
class VerbalQuestion < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :gazette

  acts_as_taggable_on :involved_people

  before_save { self.involved_person_list = self.scaned_people}

  def to_html
    @converter = Redcarpet::Markdown.new(Redcarpet::Render::HTMLwithSyntaxHighlight.new, {
                                           :autolink => true,
                                           :fenced_code_blocks => true,
                                           :no_intra_emphasis => true
    })
    @converter.render(content)
  end

  def scaned_people
    array = content.scan(/^\r\n([^：]{2,10})：/)
    array.uniq!
  end



end
