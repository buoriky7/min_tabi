class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.integer :timeline_id
      t.integer :user_id
      t.integer :place_id
      t.string :caption , null: false
      t.integer :article_image_id
      t.text :body
      t.integer :star , default: 0

      t.timestamps
    end
  end
end
