class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :replied_to, class_name: "Tweet", optional: true
  belongs_to :tweet, class_name: "Tweet", optional: true
  # belongs_to(replied_to, class_name: "tweet, Opcional: true")
  has_many :likes, dependent: :destroy
  has_many :replies, class_name: "Tweet",
                     foreign_key: "replied_to_id",
                     dependent: :destroy,
                     counter_cache: true

  validates :replied_to_id, presence: true, if: -> { replied_to_id.present? }
  validate :valid_replied_to_tweet, if: -> { replied_to_id.present? }

  after_create :increment_replies_count

  private

  def increment_replies_count
    replied_to.increment!(:replies_count) if replied_to.present?
  end

  def valid_replied_to_tweet
    errors.add(:replied_to_id, "must be a valid tweet") while replied_to.blank?
  end
end
