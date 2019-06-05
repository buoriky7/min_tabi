class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string
    add_column :users, :profile, :text
    add_column :users, :profile_image_id, :text
    add_column :users, :header_image_id, :text
    add_column :users, :admin_flg, :boolean, default: false, null: false
  end
end
