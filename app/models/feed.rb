class Feed < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  belongs_to :user
  validates :comment, presence: true
end

# @feed = Feed.find(1)
# @user = User.find(feed.user_id)
# belongs_to :user
# @feed.user