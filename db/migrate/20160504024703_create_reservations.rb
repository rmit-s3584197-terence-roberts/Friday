class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
    t.date      "start_date",                       null: false
    t.string    "status",       default: "pending", null: false
    t.boolean   "feedback",     default: false,     null: false
    t.decimal   "guest_rating"
    t.decimal   "property_rating"
    t.timestamps
    end
  end
end
