class Template < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarking_users, through: :bookmarks, source: :user
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user
  before_save :extract_link_from_usage_example
  acts_as_taggable_on :tags

  belongs_to :user
  belongs_to :category

  def bookmarked_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  def self.ransackable_attributes(auth_object = nil)
    ['title', 'content'] 
  end

  def self.ransackable_associations(auth_object = nil)
    ['user', 'category']
  end

  private

  def extract_link_from_usage_example
    link_regex = /https:\/\/chat\.openai\.com\/share\/\S+/
    link = self.usage_example[link_regex] 
    if link
      self.link = link 
      chat_content = get_chat_content_from_link(link)
      self.chat_content = chat_content
    end
  end
  
  def get_chat_content_from_link(link)
  end
end