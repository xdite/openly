class Gazette < ActiveRecord::Base
  # attr_accessible :title, :body

  def fetch_content_from_github
    require 'open-uri'
    data = open("https://raw.github.com/g0v/ly-gazette/master/raw/#{ly_id}.md")
    raw = data.read
    update_attribute(:content,raw)
  end
end
