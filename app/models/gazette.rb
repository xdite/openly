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

  include ActionView::Helpers::TextHelper
  include ERB::Util

  def excerpt_text_for_search(query_string)
    text = content
    
    tokens = query_string.split(/[\\. ,+#-%^&*]/)
    text = text.gsub(/<.*?>/,"")
    return_string ||= ""
    tokens.each do |token|
      excerpt_text = h(excerpt(text, token, :radius => 100)) 
      replace_text = excerpt_text.gsub!(token, content_tag(:span, token, :class => "match"))

      return_string.concat(%Q| "#{replace_text} |)
    end

    return simple_format(return_string)
  end

  def excerpt_text_for_search_cache(query_string)
    Rails.cache.fetch("gazette-#{id}-#{updated_at}-#{query_string}", :expires_in => 1.hours ) do
      excerpt_text_for_search(query_string)
    end
  end


end
