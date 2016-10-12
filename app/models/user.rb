class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data["email"]).first

    if !user
      generated_password = Devise.friendly_token.first(8)
      user = User.new email: data["email"], password: generated_password, password_confirmation: generated_password
      user.save
    end
    user
  end         
end
