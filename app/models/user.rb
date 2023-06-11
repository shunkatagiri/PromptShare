# app/models/user.rb
class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :bookmarks
  has_many :bookmarked_templates, through: :bookmarks, source: :template
  has_many :likes
  has_many :liked_templates, through: :likes, source: :template
  
  validates :name, presence: true
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, presence: true, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, uniqueness: true

  has_many :templates
end
