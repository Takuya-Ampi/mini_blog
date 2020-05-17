class Post < ApplicationRecord
  validates :content, {presence: true, length: {maximum: 400}}
  validates :user_id, {presence: true}
  # インスタンスメソッドuserを定義
  def user
    return User.find_by(id: self.user_id)
  end
end
