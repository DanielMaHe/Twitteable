class Tweet < ApplicationRecord
  belongs_to :user
  # belongs_to :replied_to
  belongs_to :replied_to, class_name: "Tweet", optional: true
  # belongs_to(replied_to, class_name: "tweet, Opcional: true")
  has_many :likes, dependent: :destroy

  # belongs_to :replied_to, class_name: 'Tweet', optional: true
  has_many :replies, class_name: 'Tweet', foreign_key: 'replied_to_id', dependent: :destroy, counter_cache: true
  belongs_to :tweet, class_name: 'Tweet', optional: true

  after_create :increment_replies_count

  private

  def increment_replies_count
    replied_to.increment!(:replies_count) if replied_to.present?
  end
  
end
