# -*- encoding : utf-8 -*-
class ElectionsController < ApplicationController

  def index
    @elections = Election.all
  end

  def show
    @election = Election.find(params[:id])
    @committees = @election.committees
  end
end
