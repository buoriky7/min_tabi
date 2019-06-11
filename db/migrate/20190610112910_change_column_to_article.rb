class ChangeColumnToArticle < ActiveRecord::Migration[5.2]
  def up
  	change_column :articles, :article_image_id, :string
  end

    def down
  	change_column :articles, :article_image_id, :integer
  end
end
