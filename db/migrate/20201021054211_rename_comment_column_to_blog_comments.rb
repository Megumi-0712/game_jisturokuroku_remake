class RenameCommentColumnToBlogComments < ActiveRecord::Migration[5.2]
  def change
  	rename_column :blog_comments, :comment, :comment_text
  end
end
