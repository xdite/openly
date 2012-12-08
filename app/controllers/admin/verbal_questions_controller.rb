class Admin::VerbalQuestionsController < ApplicationController

  before_filter :find_gazette

  def new
    @verbal_question = @gazette.verbal_questions.build
  end

  def create
    @verbal_question = @gazette.verbal_questions.build(params[:verbal_question])

    if @verbal_question.save
      redirect_to gazette_path(@gazette.ly_id)
    else
      render :new
    end
  end


  protected

  def find_gazette
    @gazette = Gazette.find(params[:gazette_id])
  end

end
