class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :correct_user, only: [:edit, :update]

	def index
		@user = current_user
		@users = User.all
	end

	def show
		@user = User.find_by(id: params[:id])
		@blogs = @user.blogs
	end

	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		if @user.save
			flash[:notice] = "ゲーム実録々にご登録いただき、有難うございます！"
			redirect_to user_path(@user.id)
		else
			flash.now[:error]
			render :new
		end
	end

	def edit
		@user = User.find(params[:id])
		@users = User.all
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:notice] = "設定が完了しました"
			redirect_to user_path(@user.id)
		else
			flash.now[:error]
			render :edit
		end
	end

	private
	def user_params
		params.require(:user).permit(:name, :profile_image, :introduction)
	end

	def correct_user
		user = User.find(params[:id])

		unless user == current_user
		redirect_to(user_path(current_user))
		end
	end
end
