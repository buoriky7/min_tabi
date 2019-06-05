class CreateTimelines < ActiveRecord::Migration[5.2]
  def change
    create_table :timelines do |t|
      t.integer :user_id
      t.string :title
      t.integer :clips_count

      t.timestamps
    end
  end
end
