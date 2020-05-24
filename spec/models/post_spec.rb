require 'rails_helper'

RSpec.describe Post, type: :model do
  # Postモデルにレコードをcreateする際のテスト
  describe '#create' do
    it "本文、タイトル、ユーザーidがある場合、有効である" do
      post = FactoryBot.build(:post)
      expect(post).to be_valid
    end
    it "本文がない場合、無効である" do
      post = FactoryBot.build(:post, content: nil)
      post.valid?
      expect(post.errors[:content]).to include("を入力してください")
    end
    it "本文の長さが401文字以上の場合、無効である" do
      post = FactoryBot.build(:post, content:  "a" * 401)
      post.valid?
      expect(post.errors[:content]).to include("は400文字以内で入力してください")
    end
    it "タイトルがない場合、無効である" do
      post = FactoryBot.build(:post, title: nil)
      post.valid?
      expect(post.errors[:title]).to include("を入力してください")
    end
    it "タイトルの長さが21文字以上の場合、無効である" do
      post = FactoryBot.build(:post, title:  "a" * 21)
      post.valid?
      expect(post.errors[:title]).to include("は20文字以内で入力してください")
    end
    it "ユーザーidがない場合、無効である" do
      post = FactoryBot.build(:post, user_id: nil)
      post.valid?
      expect(post.errors[:user_id]).to include("を入力してください")
    end
  end
end
