class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

         # you can add some styles for different sizes
  has_attached_file :avatar, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/


  has_many :posts	
  has_many :comments
  has_many :likes


  # def age
  # 	return (Time.now - dob).years
  # end

end


# @user = User.find(10)
# @user.age











