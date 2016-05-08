class AddCombinedCityCountryToProperties < ActiveRecord::Migration
  def up
  	add_column :properties, :combined_city_country, :string

  end
   
   def down
  	remove_column :properties, :combined_city_country, :string
  end
end
