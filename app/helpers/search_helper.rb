# -*- encoding : utf-8 -*-
module SearchHelper

 def search_match_result(text,query_string)
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


end
