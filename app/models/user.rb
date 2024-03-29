class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
  format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  has_many :favorites, dependent: :destroy
  has_many :feeds
end

# @user = User.find(1)
# @feeds = Feed.where(user_id: @user.id) => [feed1, feed2 ...]
# has_many :feeds
# @user.feeds  => [feed1, feed2 ...]