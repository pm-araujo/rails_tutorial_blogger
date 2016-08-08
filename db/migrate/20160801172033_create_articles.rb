class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.fixnum :view_count
      t.text :body
      
      t.timestamps
    end
  end
end
