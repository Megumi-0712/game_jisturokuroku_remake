class RenameCommentColumnToPostComments < ActiveRecord::Migration[5.2]
  def change
  	rename_column :post_comments, :comment, :comment_text
  end
end
