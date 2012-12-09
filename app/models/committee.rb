# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: committees
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  party_id       :integer
#  party_group_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

# -*- encoding : utf-8 -*-
class Committee < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :party
  belongs_to :party_group

  has_many :election_committees
  has_many :elections, :through => :election_committees
end
