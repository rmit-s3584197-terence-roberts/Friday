class Property < ActiveRecord::Base

	belongs_to :user

	validates_presence_of :name, :user_id, :address, :city, :country, :num_rooms, :ac_available, :pool_available, :num_points

end
