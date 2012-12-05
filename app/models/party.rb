# -*- encoding : utf-8 -*-
class Party < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :committees
end
