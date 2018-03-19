class  PostsController < ApplicationController

	def index

		@post = Post.new
		@comment = Comment.new
		# @posts = Post.all
		@page = params[:page].blank? ? 1 : params[:page].to_i
		@count = params[:count].blank? ? 2 : params[:count].to_i

		@max_pages = Post.all.length/@count
		
		@posts = Post.offset((@page - 1) * @count).limit(@count)

		
	end

	def create
		@post = Post.create(
				content: params[:post][:content],
				user_id: current_user.id
				# or you can do
				# user: current_user
			)
		@comment = Comment.new


	end

end
