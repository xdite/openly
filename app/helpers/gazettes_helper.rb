# -*- encoding : utf-8 -*-
require 'markdown'
module GazettesHelper

  def render_gazette_content(str,options = {})
    @converter = Redcarpet::Markdown.new(Redcarpet::Render::HTMLwithSyntaxHighlight.new, {
                                           :autolink => true,
                                           :fenced_code_blocks => true,
                                           :no_intra_emphasis => true
    })
    @converter.render(str)
  end

  def render_gazette_status(gazette)
    if gazette.content.present?
      "已有內容"
    else
      "需要更新"
    end
  end

  def render_gazette_title(gazette)
    if gazette.content.present?
      link_to(gazette.ly_id, gazette_path(gazette.ly_id) )
    else
      gazette.ly_id
    end
  end
end
