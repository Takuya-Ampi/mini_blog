class Post < ApplicationRecord
  validates :content, {presence: true, length: {maximum: 400}}
end
