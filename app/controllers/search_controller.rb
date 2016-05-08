class SearchController < ApplicationController

  def search
  	@search_location = params[:location]
    @search_date = params[:date]
    flash[:properties] = @search_location

  	@results = Property.where(['combined_city_country LIKE ?', flash[:properties]])


    redirect_to(:action => 'index')
  end

  def index
  	@results = Property.where(['combined_city_country LIKE ?', flash[:properties]])
  end
end
