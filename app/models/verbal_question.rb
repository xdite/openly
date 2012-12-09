# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: verbal_questions
#
#  id         :integer          not null, primary key
#  content    :text
#  gazette_id :integer
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

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
