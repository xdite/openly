# -*- encoding : utf-8 -*-
class ElectionCommittee < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :committee
end
