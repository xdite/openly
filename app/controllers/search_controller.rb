# -*- encoding : utf-8 -*-
class SearchController < ApplicationController
  #  caches_action :search,  :expires_in => 1.hours , :cache_path => Proc.new { |c| c.params }

  before_filter :validate_search_key

  def index
    if @query_string.present?
      search = Gazette.search(@search_criteria)
      @gazettes = search.result(:distinct => true).paginate(:page => params[:page], :per_page => 20)

    end
  end

  protected

  def validate_search_key
    @query_string = params[:q].gsub(/\\|\'|-|\/|\.|\?/, "") if params[:q].present?
    @search_criteria = {
      :content_cont => @query_string
    }
  end

end
