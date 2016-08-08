class AddViewcountToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :view_count, :fixnum
  end
end
