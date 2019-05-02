class Gossip < ApplicationRecord
  belongs_to :user
  has_many :join_tags_gossips
  has_many :tags, through: :join_tags_gossips
  has_many :comments
  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :content, presence: true

  has_many :likes
  # validate :validate_content_length

  # private

  # def validate_content_length
  #   if title.length > 14 || title.length < 3
  #     errors.add :content, "Title must be between 3  and 14 characters)"
  #   end
  #   true
  # end
end
