# -*- encoding : utf-8 -*-
class Committee < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :party
  belongs_to :party_group

  has_many :election_committees
end
