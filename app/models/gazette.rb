# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: gazettes
#
#  id         :integer          not null, primary key
#  content    :text(2147483647)
#  ly_id      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# -*- encoding : utf-8 -*-
require 'markdown'
class Gazette < ActiveRecord::Base
  # attr_accessible :title, :body

  has_many :verbal_questions

  include MarkdownHtml



  scope :recent, :order => "id DESC"

  def to_param
    ly_id
  end

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
