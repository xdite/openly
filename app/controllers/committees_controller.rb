# -*- encoding : utf-8 -*-
class CommitteesController < ApplicationController

  def show
    @committee = Committee.find(params[:id])
    @elections = @committee.elections
  end
end
