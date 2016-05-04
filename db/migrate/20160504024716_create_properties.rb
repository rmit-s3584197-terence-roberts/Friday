class CreateProperties < ActiveRecord::Migration
  def up
    create_table :properties do |t|
    t.string  "name",         	limit: 50,  null: false
    t.integer "user_id",      	limit: 4,   null: false
    t.string  "address",      	limit: 255, null: false
    t.string  "city",         	limit: 255, null: false
    t.string  "country",      	limit: 255, null: false
    t.string  "availability", 	limit: 255, null: false
    t.integer "num_rooms",    	limit: 4,   null: false
    t.boolean "ac_available",   null: false
    t.boolean "pool_available", null: false
    t.integer "num_points",     limit: 4,   null: false
    t.float   "discount",       limit: 53,  null: false
    t.timestamps 
    end
    add_index "properties", "user_id"
  end

  def down
  	drop_table :properties
  end
end
