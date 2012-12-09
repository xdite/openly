# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: elections
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# -*- encoding : utf-8 -*-
class Election < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :election_committees
  has_many :committees, :through => :election_committees


end
