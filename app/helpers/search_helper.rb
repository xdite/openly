# -*- encoding : utf-8 -*-
module SearchHelper

 def search_match_result(text,query_string)
    tokens = query_string.split(/[\\. ,+#-%^&*]/)
    text = text.gsub(/<.*?>/,"")
    return_string ||= ""
    tokens.each do |token|
      return_string.concat(%Q|#{h(excerpt(text, token, :radius => 100)) }|)
    end

    return simple_format(return_string)

  end


end
