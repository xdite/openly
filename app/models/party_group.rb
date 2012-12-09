# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: party_groups
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# -*- encoding : utf-8 -*-
class PartyGroup < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :committees
end
