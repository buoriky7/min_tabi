class ChangeColumnToPlace < ActiveRecord::Migration[5.2]
  def change
    rename_column :places, :text, :address
  end
end
