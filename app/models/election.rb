class Election < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :election_committees
  has_many :committees, :through => :election_committees


end
