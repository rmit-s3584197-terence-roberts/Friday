class ReservationsController < ApplicationController

  layout 'application'
  
  before_filter :authorize

end
