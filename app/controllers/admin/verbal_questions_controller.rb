class Admin::VerbalQuestionsController < ApplicationController

  def new
    @gazette = Gazette.find(params[:gazette_id])
    @vebal_question = @gazette.verbal_questions.build
  end
end
