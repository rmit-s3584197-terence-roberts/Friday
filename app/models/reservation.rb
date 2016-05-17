class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :property

  validates_presence_of :user, :property, :start_date, :status

  enum status: [ :pending, :confirmed, :rejected ]
end
