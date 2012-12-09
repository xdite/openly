# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: parties
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# -*- encoding : utf-8 -*-
class Party < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :committees
end
