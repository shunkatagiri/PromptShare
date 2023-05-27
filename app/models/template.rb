class Template < ApplicationRecord
  has_many :bookmarks
  has_many :bookmarking_users, through: :bookmarks, source: :user
  
  belongs_to :user
  belongs_to :category
end
