class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.integer :price
      t.integer :seller_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
