class CommentSerializer < ActiveModel::Serializer
  attributes :content, :author_email


  def author_email
  	object.user.email
  end
end
