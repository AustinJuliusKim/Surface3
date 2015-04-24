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

	def edit
		@post = Post.find(params[:id])
	end

	def create
		@user = User.find(params[:id])
		@post = @user.posts.new(params.require(:post).permit(:body))
		if @post.save
			flash[:success] = "Post successful!"
			redirect_to user_path(@user)
		else
			redirect_to user_path(@user)
		end

	end

	def update
		@post = Post.find(params[:id])
		unless @post.update_attributes(params.require(:post).permit(:body))
			redirect_to user_path(@user)
		end
	end

	def destroy
		@post = Post.find(params[:id])
		if @post.present?
			@post.destroy
		else
		redirect_to user_path
		end
	end
end
