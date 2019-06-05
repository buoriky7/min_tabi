class CreateArticleIcons < ActiveRecord::Migration[5.2]
  def change
    create_table :article_icons do |t|
      t.integer :article_id
      t.integer :timeline_id
      t.integer :icon_id , default: 0

      t.timestamps
    end
  end
end
