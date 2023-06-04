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

  def self.ransackable_attributes(auth_object = nil)
    ['title', 'content'] # ここに検索可能な属性を追加します
  end

  def self.ransackable_associations(auth_object = nil)
    ['user', 'category'] # 検索可能な関連付け
  end
end