class  CommentsController < ApplicationController


	def create
		if (params[:comment][:parent_type] == 'Post')
			@parent = Post.find(params[:comment][:parent_id])
		else
			@parent = Comment.find(params[:comment][:parent_id])
		end

		@comment = Comment.create(
				content: params[:comment][:content],
				user_id: current_user.id,
				parent: @parent
				# or you can do
				# user: current_user
			)


	end

end
