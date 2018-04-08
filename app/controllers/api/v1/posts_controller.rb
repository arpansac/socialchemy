module Api
	module V1

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

				query = params[:term]
				@posts = @posts.where('content like ? ', ('%' + query + '%'))

				return render json: @posts, adapter: :json, root: "posts"

				
			end


		end
	end
end