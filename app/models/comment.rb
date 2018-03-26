class Comment < ActiveRecord::Base

	belongs_to :user
	
	belongs_to :parent, polymorphic: true

	has_many :comments, as: :parent
	has_many :likes, as: :parent

	def user_can_like(user)
		return !(self.likes.find_by(user: user))
	end

	def current_like_status_string(user)
		if user_can_like(user)
			return 'Like'
		else
			return 'Unlike'
		end

	end
end
