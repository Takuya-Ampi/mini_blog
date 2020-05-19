class User < ApplicationRecord
  validates :name, {presence: true, length: {maximum: 20}}
  validates :email, {presence: true, uniqueness: true}
  validates :password, {presence: true, length: { minimum: 6, maximum: 12 }}
  def posts
    return Post.where(user_id: self.id)
  end
end
