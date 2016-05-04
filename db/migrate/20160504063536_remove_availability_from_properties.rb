class RemoveAvailabilityFromProperties < ActiveRecord::Migration
  def change
    remove_column :properties, :availability, :string
  end
end
