class User < ApplicationRecord
  has_many :projects
  has_many :categories, through: :projects

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]
  
  has_many :tasks, dependent: :destroy

  def self.from_omniauth(access_token)
    data = access_token.info
    if data["email"].include? "growthaccelerationpartners.com"
      user = User.where(email: data["email"]).first
      if !user
        generated_password = Devise.friendly_token.first(8)
        user = User.new email: data["email"], password: generated_password, password_confirmation: generated_password, first_name:  data["first_name"], last_name: data["last_name"], profile_picture: data["image"]  
        user.save
      end
      user
    end
  end         
end
