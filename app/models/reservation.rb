class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :property

  validates_presence_of :user, :property

  enum status: [ :pending, :confirmed, :rejected ]
end
