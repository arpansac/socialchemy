class  LikesController < ApplicationController

	def toggle
		# Assignment: use the method in models for user_can_like in both posts and comments
		like = Like.find_by(
			parent_type: params[:parent_type], 	
			parent_id: params[:parent_id],
			user: current_user
			)

		if like.blank?
			like = Like.create(
					parent_type: params[:parent_type], 	
					parent_id: params[:parent_id],
					user: current_user
				)
			@liked = true
		else

			like.destroy
			@liked = false

		end
			
	end

end
