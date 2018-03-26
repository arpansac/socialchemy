class Post < ActiveRecord::Base

	belongs_to :user
	has_many :comments, as: :parent
	has_many :likes, as: :parent

	def user_can_like(user)
		return !(self.likes.find_by(user: user))
	end

	def current_like_status_string(user)
		if user_can_like(user)
			return '<i class="fa fa-thumbs-o-up"></i>'
		else
			return '<i class="fa fa-thumbs-o-down"></i>'
		end

	end
end
