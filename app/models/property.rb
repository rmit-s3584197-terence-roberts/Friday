class Property < ActiveRecord::Base

	belongs_to :user
	has_many :reservations
	has_many :users, through: :reservations

	geocoded_by :address

	validates_presence_of :name, :user_id, :address, :city, :country,
	  :num_rooms, :num_points, :photo

	has_attached_file :photo
	validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	after_validation :geocode, :if => :address_changed?

	before_save { |property| property.combined_city_country = "#{property.city}" + ", " + "#{property.country}" }

end
