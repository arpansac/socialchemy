class CommentMailWorker
	@queue = :emails

	def self.perform(comment_id)
		
		comment = Comment.find(comment_id)

		UserMailer.new_comment(comment).deliver_now
	end

end