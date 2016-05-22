class User < ActiveRecord::Base

	before_save {email.downcase!}
	before_save {username.downcase!}

    has_secure_password

	has_many :properties
	has_many :reservations

	validates :username, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  	validates :email, presence: true, uniqueness: { case_sensitive: false }
  	validates_presence_of :first_name, :last_name, :city, :country, :address, :phone

  	has_attached_file :userpic
    validates_attachment_content_type :userpic, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end
