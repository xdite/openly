class GazettesController < ApplicationController
  def show
    @gazette = Gazette.find_or_create_by_ly_id(params[:id])
    @verbal_questions = @gazette.verbal_questions
    if @gazette.content.blank?
      @gazette.fetch_content_from_github
    end
  end

  def index
    @gazettes = Gazette.recent.paginate(:per_page => 20, :page => params[:page])
  end
end
