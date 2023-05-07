class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :omniauthable, omniauth_providers: %i[github]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  has_one_attached :avatar
  has_many :tweets, dependent: :nullify
  has_many :likes, dependent: :nullify

  validates :username, presence: true, uniqueness: true
  # validates :email_attributes,email: true
  validates :email, presence: true, uniqueness: true
  validates :role, presence: true
  validates :name, presence: true

  enum role: { member: 0, admin: 1 }

  def self.from_omniauth(auth_hash)
    where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create do |user|
      user.username = auth_hash.info.nickname
      user.name = auth_hash.info.name
      user.email = auth_hash.info.email
      user.password = Devise.friendly_token
      user.provider = auth_hash.provider
      user.uid = auth_hash.uid
    end
  end

end
