class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :email
      t.text :content
      t.string :nikename
      t.references :article, index: true

      t.timestamps
    end
  end
end
