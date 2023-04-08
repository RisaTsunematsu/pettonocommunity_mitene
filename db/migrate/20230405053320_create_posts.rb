class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :title
      t.string :tag
      t.text :body
      t.timestamps
    end
  end
end
