class Property < ActiveRecord::Base

	belongs_to :user

	geocoded_by :address

	validates_presence_of :name, :user_id, :address, :city, :country, 
	  :num_rooms, :num_points, :photo

	has_attached_file :photo
	validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	after_validation :geocode, :if => :address_changed?

	def self.search search_term
	  return scoped unless search_term.present? 
	  where(['city LIKE ?', "%#{search_term}%"] AND ['country LIKE ?', "%#{search_term}%"]) 
	end	

end
