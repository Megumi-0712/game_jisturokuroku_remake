class BlogCommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		blog = Blog.find(params[:blog_id])		#blog_idのカラムに関係する
		comment = current_user.blog_comments.new(blog_comment_params)	 	#ブログにコメントが作成される
		comment.blog_id = blog.id		#コメントのidとユーザーidは一緒
		comment.save
			flash[:success] = "コメントしました"
			redirect_to blog_path(blog)
	end

	private
	def blog_comment_params
		params.require(:comment).permit(:user_id, :blog_id, :comment_text)
	end

	def correct_blog_comment
		comment = BlogComment.find(params[:id])
		user = blog_comment.user
		unless user == current_user
			redirect_to(user_path)
		end
	end
end
