class AddColumnToPlace < ActiveRecord::Migration[5.2]
  def change
    add_column :places, :latitude, :float
    add_column :places, :longitude, :float
    rename_column :places, :place_name, :text
  end
end
