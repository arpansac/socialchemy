class  PostsController < ApplicationController

	def index

		@post = Post.new
		@comment = Comment.new
		# @posts = Post.all

	end

	def create
		@post = Post.create(
				content: params[:post][:content],
				user_id: current_user.id
				# or you can do
				# user: current_user
			)


	end

end
