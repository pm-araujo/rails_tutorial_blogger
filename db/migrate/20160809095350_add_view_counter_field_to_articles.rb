class AddViewCounterFieldToArticles < ActiveRecord::Migration[5.0]
  def change
	add_column :articles, :view_count, :integer, default: 0
	add_index :articles, :view_count
  end
end
