class AddPropertyToReservation < ActiveRecord::Migration
  def change
    add_reference :reservations, :property, index: true, foreign_key: true
  end
end
