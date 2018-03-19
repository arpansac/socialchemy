class UserMailer < ApplicationMailer

	def new_comment(comment)
		@comment = comment
		mail(
				to: @comment.user.email,
				subject: "Socialchemy:New Comment"
			)
	end

end
