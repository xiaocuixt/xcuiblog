class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.string :author
      t.string :tags
      t.string :category
      t.string :image
      t.string :summary
      t.integer :view_count

      t.timestamps
    end
  end
end
