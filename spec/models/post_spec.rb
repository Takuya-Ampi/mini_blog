require 'rails_helper'

RSpec.describe Post, type: :model do
  # ポストモデルのバリデーションのテスト
  describe 'バリデーション' do
    context '本文、タイトル、ユーザーidがある場合' do
      it "有効" do
        post = FactoryBot.build(:post)
        expect(post).to be_valid
      end
    end
    describe '本文' do
      context '本文がない場合' do
        it "無効" do
          post = FactoryBot.build(:post, content: nil)
          post.valid?
          expect(post.errors[:content]).to include("を入力してください")
        end
      end
      context '本文の長さが401文字以上の場合' do
        it "無効" do
          post = FactoryBot.build(:post, content:  "a" * 401)
          post.valid?
          expect(post.errors[:content]).to include("は400文字以内で入力してください")
        end
      end
    end
    describe 'タイトル' do
      context 'タイトルがない場合' do
        it "無効" do
          post = FactoryBot.build(:post, title: nil)
          post.valid?
          expect(post.errors[:title]).to include("を入力してください")
        end
      end
      context 'タイトルの長さが21文字以上の場合' do
        it "無効" do
          post = FactoryBot.build(:post, title:  "a" * 21)
          post.valid?
          expect(post.errors[:title]).to include("は20文字以内で入力してください")
        end
      end
    end
    describe 'ユーザーid' do
      context 'ユーザーidがない場合' do
        it "無効" do
          post = FactoryBot.build(:post, user_id: nil)
          post.valid?
          expect(post.errors[:user_id]).to include("を入力してください")
        end
      end
    end
  end
end
