# -*- encoding : utf-8 -*-
class VerbalQuestionsController < ApplicationController
  before_filter :find_gazette


  def show
    @verbal_question =  VerbalQuestion.find(params[:id])
  end
  
  protected

  def find_gazette
    @gazette = Gazette.find_by_ly_id(params[:gazette_id])
  end



end
