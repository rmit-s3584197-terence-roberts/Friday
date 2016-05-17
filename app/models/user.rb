class User < ActiveRecord::Base

	before_save {email.downcase!}
	before_save {username.downcase!}

    has_secure_password

	has_many :properties
	has_many :reservations

	validates :username, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  	validates :email, presence: true, uniqueness: { case_sensitive: false }
  	validates_presence_of :first_name, :last_name, :password, :city, :country, :address, :phone

end
