class CommentDetailsSerializer < ActiveModel::Serializer
  attributes :id, :user, :content
end
