class CreatePostComments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_comments do |t|
      t.string :name
      t.text :comment
      t.integer :user_id
      t.integer :blog_id

      t.timestamps
    end
  end
end