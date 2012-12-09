# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: committee_verbal_questions
#
#  id                 :integer          not null, primary key
#  committee_id       :integer
#  verbal_question_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class CommitteeVerbalQuestion < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :committee
  belongs_to :verbal_question
end
