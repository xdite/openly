# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: election_committees
#
#  id           :integer          not null, primary key
#  election_id  :integer
#  committee_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

# -*- encoding : utf-8 -*-
class ElectionCommittee < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :committee
  belongs_to :election
end
