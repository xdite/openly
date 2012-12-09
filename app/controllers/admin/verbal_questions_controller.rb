# -*- encoding : utf-8 -*-
class Admin::VerbalQuestionsController < ApplicationController

  before_filter :require_is_admin
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

  def edit
    @verbal_question =  VerbalQuestion.find(params[:id])

  end

  def update
    @verbal_question =  VerbalQuestion.find(params[:id])
    if @verbal_question.update_attributes((params[:verbal_question]))
      redirect_to gazette_path(@gazette.ly_id)
    else
      render :edit
    end
  end

  protected

  def find_gazette
    @gazette = Gazette.find_by_ly_id(params[:gazette_id])
  end

end
