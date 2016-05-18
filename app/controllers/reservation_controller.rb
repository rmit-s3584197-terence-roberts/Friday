class ReservationController < ApplicationController

  layout 'application'

  before_filter :authorize

  def index
    @user = User.find_by_id(params[:user_id])
    @properties = Property.all.where(user_id: params[:user_id])
    @reservationsAsGuest = Reservation.all.where(user_id: params[:user_id])

  end

  def new
  	@property = Property.find_by_id(params[:id])
    @guest = User.find_by_id(session[:user_id])
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @property = Property.find_by_id(@reservation.property_id)
    @host = User.find_by_id(@property.user_id)

    if @reservation.save
      flash[:notice] = "Your request has been submitted."
      ReservationMailer.reservation_request_email(@host)
      redirect_to :controller => 'properties', :action => 'show', :id => @reservation.property_id
    else
      flash[:notice] = "There was a problem submitting your request."
      redirect_to :controller => 'properties', :action => 'show', :id => @reservation.property_id
    end

  end

  def accept
    @host = User.find_by_id(params[:host_id])
    @guest = User.find_by_id(params[:guest_id])
    redirect_to :controller => 'reservation', :action => 'index', :id => session[:user_id]
  	# User property.user_id gets alert of new request from user.id
  	# User property.user_id reviews request at Reservation.show()
  	# User property.user_id accepts request
  	# User property.user_id receives Property.num_points
  	# User user.id is deducted Property.num_points

  end

  def reject
    redirect_to :controller => 'reservation', :action => 'index', :id => :id
   	# User property.user_id gets alert of new request from user.id
  	# User property.user_id reviews request at Reservation.show()
  	# User property.user_id rejects request
   	# Property.id is marked available for date specified

  end


  def show
  end

  def update
  end

  def delete
  end

  def destroy
  end

  private
    def reservation_params
      params.require(:reservation).permit(:start_date, :property_id, :status, :user_id)
    end
end
