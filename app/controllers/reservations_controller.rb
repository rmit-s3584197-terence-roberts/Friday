class ReservationsController < ApplicationController

  layout 'application'
  
  before_filter :authorize

  def index
  end

  def new
  	@reservation = Reservation.new
  end

  def create

  	# User user.id submits request for property.id to User property.user_id
  	# Check if request date == property.available date(s)
  	# Check if user.points >= property.num_points
  	# Send request to property.user_id
  	# Property.id is marked unavailable for date specified pending accept/reject

  end

  def accept

  	# User property.user_id gets alert of new request from user.id  
  	# User property.user_id reviews request at Reservation.show()
  	# User property.user_id accepts request
  	# User property.user_id receives Property.num_points
  	# User user.id is deducted Property.num_points

  end

  def reject

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


end
