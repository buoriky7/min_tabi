class AddColumnToTimeline < ActiveRecord::Migration[5.2]
  def change
    add_column :timelines, :post_flag, :integer, after: :title, default: 0
  end
end
