class AddLongitudeAndLatitudeToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :longitude, :float
    add_column :properties, :latitude, :float
  end
end
