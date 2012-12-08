# -*- encoding : utf-8 -*-
require 'markdown'
class VerbalQuestion < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :gazette

  include MarkdownHtml

  acts_as_taggable_on :involved_people

  before_save { self.involved_person_list = self.scaned_people}

  def scaned_people
    array = content.scan(/^\r\n([^：]{2,10})：/)
    array.uniq!
  end



end
