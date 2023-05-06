class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :tweets, dependent: :nullify
  has_many :likes, dependent: :nullify

  validates :username, presence: true, uniqueness: true
  # validates :email_attributes,email: true
  validates :email, presence: true, uniqueness: true
  validates :role, presence: true
  validates :name, presence: true

  enum role: { member: 0, admin: 1 }
end
