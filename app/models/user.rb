class User < ApplicationRecord
  has_one :team

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: %i[starladder]

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_create do |user|
      user.email = auth.info.email
      user.nick = auth.info.nick
      user.password = Devise.friendly_token[0,20]
    end
  end
end
