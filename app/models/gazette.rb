class Gazette < ActiveRecord::Base
  # attr_accessible :title, :body

  has_many :verbal_questions
  

  def to_param
    ly_id
  end
  scope :recent, :order => "id DESC"
  def fetch_content_from_github
    require 'open-uri'
    data = open("https://raw.github.com/g0v/ly-gazette/master/raw/#{ly_id}.md")
    raw = data.read
    update_attribute(:content,raw)
  end

  def update_from_local_data

    g = self
    data = IO.read("#{Rails.root}/doc/ly-gazette/raw/#{ly_id}.md")

    g.content = data
    g.save

  end
end
