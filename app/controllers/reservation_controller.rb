class ReservationController < ApplicationController

  layout 'application'

  before_filter :authorize

  def index
    @user = User.find_by_id(params[:user_id])
    @properties = Property.all.where(user_id: params[:user_id])
    @reservationsAsGuest = Reservation.all.where(user_id: params[:user_id])

  end

  def userRating
    @user = User.find_by_id(params[:guest_id])
    @reservation = Reservation.find_by_id(params[:reservation_id])
  end

  def enterRating
    @reservation = Reservation.find_by_id(params[:reservation_id])
    @user = User.find_by_id(params[:user_id])
    @allReservations = Reservation.all.where(user_id: params[:user_id])

    @reservation.update_attribute(:guest_rating, params[:reservation][:guest_rating])

    sumratings = 0
    @allReservations.each{|x| sumratings=sumratings+x[:guest_rating]};
    @user.update_attribute(:rating, (sumratings/@allReservations.length))
    redirect_to(:controller => 'reservation', :action => 'index', :user_id => @user.id)
  end

  def propertyFeedback
    @reservation = Reservation.find_by_id(params[:reservation_id])
  end

  def enterFeedback
    @reservation = Reservation.find_by_id(params[:reservation_id])
    @property = Property.find_by_id(params[:property_id])
    @allReservations = Reservation.all.where(property_id: params[:property_id])

    @reservation.update_attribute(:property_rating, params[:reservation][:property_rating])

    sumratings = 0
    @allReservations.each{|x| sumratings=sumratings+x[:property_rating]};
    @property.update_attribute(:rating, (sumratings/@allReservations.length))
    redirect_to(:controller => 'reservation', :action => 'index', :user_id => session[:user_id])
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
      flash[:alert] = "There was a problem submitting your request."
      redirect_to :controller => 'properties', :action => 'show', :id => @reservation.property_id
    end

  end

  def accept
    @host = User.find_by_id(params[:host_id])
    @guest = User.find_by_id(params[:guest_id])
    @property = Property.find_by_id(params[:property_id])
    @reservation = Reservation.find_by_id(params[:reservation_id])
    if @reservation.update_attribute(:status, "accepted")
      flash[:notice] = "Reservation has been confirmed."
      @host.update_attribute(:points, @host.points + @property.num_points)
      @guest.update_attribute(:points, @guest.points - @property.num_points)
      #ReservationMailer.response_accept_email(@guest)
    else
      flash[:notice] = "There was a problem accepting the reservation."
    end
    redirect_to :controller => 'reservation', :action => 'index', :user_id => session[:user_id]

  end

  def reject
    @host = User.find_by_id(params[:host_id])
    @guest = User.find_by_id(params[:guest_id])
    @property = Property.find_by_id(params[:property_id])
    @reservation = Reservation.find_by_id(params[:reservation_id])
    @reservation.status = "rejected"
    if @reservation.save
      flash[:notice] = "Reservation has been rejected."
      #ReservationMailer.response_accept_email(@guest)
    else
      flash[:notice] = "There was a problem rejecting the reservation."
    end
    redirect_to :controller => 'reservation', :action => 'index', :user_id => session[:user_id]
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
      params.require(:reservation).permit(:start_date, :property_id, :status, :user_id, :guest_rating, :property_rating)
    end
end
