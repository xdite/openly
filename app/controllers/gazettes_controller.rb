# -*- encoding : utf-8 -*-
class GazettesController < ApplicationController

  caches_action :search,  :expires_in => 1.hours , :cache_path => Proc.new { |c| "#{c.id}-#{c.updated_at}" }

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
