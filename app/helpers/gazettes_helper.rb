# -*- encoding : utf-8 -*-

module GazettesHelper

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
