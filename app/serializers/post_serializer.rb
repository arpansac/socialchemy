class PostSerializer < ActiveModel::Serializer
  attributes :id, :content, :likes_count

  has_many :comments, serializer: CommentDetailsSerializer

  def likes_count
  	object.likes.length
  end

end
