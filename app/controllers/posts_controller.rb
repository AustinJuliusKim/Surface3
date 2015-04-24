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
		if @post.save
			flash[:success] = "Post successful!"
			redirect_to user_path(@user)
		else
			render :show
		end

	end

	def destroy
		@post = Post.find(params[:id])
		if @post.present?
			@post.destroy
		end
		redirect_to user_path
	end
end
