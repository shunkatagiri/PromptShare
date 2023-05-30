class Like < ApplicationRecord
  belongs_to :user
  belongs_to :template, counter_cache: true
end
