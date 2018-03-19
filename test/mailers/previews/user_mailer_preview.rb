# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

	def new_comment_preview
		UserMailer.new_comment(Comment.last)
	end
end
