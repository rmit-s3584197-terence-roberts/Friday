class Property < ActiveRecord::Base

	belongs_to :user

	validates_presence_of :name, :user_id, :address, :city, :country, :num_rooms, :num_points

end
