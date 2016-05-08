class SearchController < ApplicationController
  def index
      @properties = Property.where(['city LIKE ?', "%#{params[:address]}%"] AND 
      	['country LIKE ?', "%#{[:address]}%"])
  end
end
