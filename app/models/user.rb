class User < ApplicationRecord
  # before_action :authenticate_user!
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :tweets, dependent: :nullify
  has_many :likes, dependent: :nullify

  # VALID_EMAIL_REGEX =/\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/

  validates :username, presence: true, uniqueness: true
  # validates :email_attributes,email: true
  validates :email, presence: true, uniqueness: true
  validates :role, presence: true
  validates :name, presence: true

  enum role: { member: 0, admin: 1 }
end
