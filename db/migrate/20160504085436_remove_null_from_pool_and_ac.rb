class RemoveNullFromPoolAndAc < ActiveRecord::Migration
  def change
    change_column :properties, :ac_available, :boolean, :null => true
    change_column :properties, :pool_available, :boolean, :null => true
  end
end
