class Post < ApplicationRecord
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  validates :content, {presence: true, length: {maximum: 400}}
  validates :title, {presence: true, length: {maximum: 20}}
  validates :user_id, {presence: true}
  # インスタンスメソッドuserを定義
  def user
    return User.find_by(id: self.user_id)
  end
end
