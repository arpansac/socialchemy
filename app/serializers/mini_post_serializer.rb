class MiniPostSerializer < ActiveModel::Serializer
  attributes :content, :author_email

  has_many :comments

  def author_email
  	object.user.email
  end
end
