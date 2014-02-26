class PostsController < ApplicationController

	def index
		#@posts = Post.all
		@posts = Post.where(:posts => { :user_id => current_user.id})
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		
		@post = Post.new(params[:post])

		@post.user_id = current_user.id

		@post.my_bulletins_id = current_user.my_bulletin.id

		if @post.save
			@post.create_activity :create, owner: current_user
			render "show", :notice => "Your post was saved"
		else
			render "new"
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if @post.update_attributes(params[:post])
			redirect_to posts_path, :notice => "Your post was updated"
		else
			render "edit"
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path, :notice => "your post has been deleted"
	end

end
