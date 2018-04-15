class CommentEmailWorker
	@queue = :emails

	# we have taken comment_id instead of the comment
	# object because redis stores data in a Hash format
	def self.perform(comment_id)

		puts('inside CommentEmailWorker perform method')
		@comment = Comment.find(comment_id)

		UserMailer.new_comment(@comment).deliver_now

	end



end