class Template < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarking_users, through: :bookmarks, source: :user
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user

  belongs_to :user
  belongs_to :category

  def bookmarked_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end