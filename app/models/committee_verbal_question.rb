class CommitteeVerbalQuestion < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :committee
  belongs_to :verbal_question
end
