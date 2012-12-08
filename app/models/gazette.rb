class Gazette < ActiveRecord::Base
  # attr_accessible :title, :body

  scope :recent, :order => "id DESC"
  def fetch_content_from_github
    require 'open-uri'
    data = open("https://raw.github.com/g0v/ly-gazette/master/raw/#{ly_id}.md")
    raw = data.read
    update_attribute(:content,raw)
  end

  def update_from_local_data
    begin
      g = self
      data = IO.read("#{Rails.root}/doc/ly-gazette/raw/#{ly_id}.md")

      g.content = data
      g.save

    rescue
    end
  end
end
