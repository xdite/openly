class GazettesController < ApplicationController
  def show
    @gazette = Gazette.find_or_create_by_ly_id(params[:id])

    if @gazette.content.blank?
      @gazette.fetch_content_from_github
    end
  end
end
