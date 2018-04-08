class  PostsController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:create]
	before_action :authenticate_user_custom, only: [:create]

	def index

		@post = Post.new
		@comment = Comment.new
		# @posts = Post.all
		@page = params[:page].blank? ? 1 : params[:page].to_i
		@count = params[:count].blank? ? 2 : params[:count].to_i

		@max_pages = Post.all.length/@count
		
		@posts = Post.offset((@page - 1) * @count).limit(@count)


		respond_to do |format|
			format.html 
			format.js
			format.json {render json: @posts, adapter: :json, root: "posts"}
		end
		
	end

	def create
		@post = Post.create(
				content: params[:post][:content],
				user_id: @current_user.id
				# or you can do
				# user: current_user
			)
		@comment = Comment.new

		respond_to do |format|
			format.html
			format.js
			format.json {render json: @post}
		end


	end

end




