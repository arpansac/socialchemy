class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable, omniauth_providers: [:google_oauth2]

         # you can add some styles for different sizes
  has_attached_file :avatar, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/


  has_many :posts	
  has_many :comments
  has_many :likes


  # def age
  # 	return (Time.now - dob).years
  # end
  def self.from_omniauth(access_token)
    byebug
    data = access_token.info
    user = User.where(email: data['email']).first

    
    unless user
        user = User.create(
           email: data['email'],
           password: Devise.friendly_token[0,20],
           confirmed_at: Time.now
        )
    end
    user
  end 

  def set_auth_token
    self.auth_token = SecureRandom.hex
    self.token_is_valid = true
    self.save
  end






end


# @user = User.find(10)
# @user.age











