class Post < ApplicationRecord
  validates :content, {presence: true, length: {maximum: 400}}
  validates :user_id, {presence: true}
end
