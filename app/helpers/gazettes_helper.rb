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
end
