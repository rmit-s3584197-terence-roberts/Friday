class Property < ActiveRecord::Base

	belongs_to :user

	validates_presence_of :name, :user_id, :address, :city, :country, 
	  :num_rooms, :num_points, :photo

	has_attached_file :photo
	validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end
