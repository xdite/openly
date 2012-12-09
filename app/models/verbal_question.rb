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
  belongs_to :gazette, :counter_cache => true
  has_many :committee_verbal_questions
  has_many :committees, :through => :committee_verbal_questions


  include MarkdownHtml

  acts_as_taggable_on :involved_people

  before_save { 
    self.involved_person_list = self.scanned_people 
    self.committee_ids = scanned_commitee
  }

  def scanned_people
    array = content.scan(/^\r\n([^：]{2,10})：/)
    array.uniq!
  end

  def scanned_commitee
    temp_person_list = involved_person_list.map { |p| p if p.scan(/委員/).present? }.reject! { |c| c.nil? }
    if temp_person_list
      temp_person_list = temp_person_list.map { |p| p.gsub!("委員", "")}  # 找出委員再抓人名
      committee_ids = Committee.find_all_by_name(temp_person_list).collect(&:id)
    end
  end

end
