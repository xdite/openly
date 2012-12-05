# -*- encoding : utf-8 -*-
class PartyGroup < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :committees
end
