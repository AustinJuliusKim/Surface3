class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@user = User.find(params[:id])
		@post = @user.posts.new(params.require(:post).permit(:body))
		@post.save
		redirect_to user_path(@user)
	end

	def destroy
		@post = Post.find(params[:id])
		if @post.present?
			@post.destroy
		end
		redirect_to users_path
	end
end
