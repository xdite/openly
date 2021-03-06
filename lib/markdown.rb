# -*- encoding : utf-8 -*-

module Redcarpet
  module Render
    class HTMLwithSyntaxHighlight < HTML


      def initialize(extensions={})
        super(extensions.merge(:xhtml => true,
                               :no_styles => true,
                               :filter_html => true,
                               :hard_wrap => true))
      end


      def block_code(code, language)
        language = 'text' if language.blank?
        begin
          Pygments.highlight(code, :lexer => language, :formatter => 'html', :options => {:encoding => 'utf-8'})
        rescue
          Pygments.highlight(code, :lexer => 'text', :formatter => 'html', :options => {:encoding => 'utf-8'})
        end
      end


    end

  end
end

module MarkdownHtml
  def to_html
      @converter = Redcarpet::Markdown.new(Redcarpet::Render::HTMLwithSyntaxHighlight.new, {
                                           :autolink => true,
                                           :fenced_code_blocks => true,
                                           :no_intra_emphasis => true
    })
    @converter.render(content)
  end
end
