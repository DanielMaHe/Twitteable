class Tweet < ApplicationRecord
  belongs_to :user
  # belongs_to :replied_to
  belongs_to :replied_to, class_name: "Tweet", optional: true
  # belongs_to(replied_to, class_name: "tweet, Opcional: true")
  has_many :likes, dependent: :destroy
end
