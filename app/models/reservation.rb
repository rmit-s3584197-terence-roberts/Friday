class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :property

  validates_presence_of :start_date

  enum status: [ :pending, :confirmed, :rejected ]
end
