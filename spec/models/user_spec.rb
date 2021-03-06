require 'rails_helper'

RSpec.describe User, type: :model do
  # ユーザーモデルのバリデーションのテスト
  describe 'バリデーション' do
    context '名前、メール、パスワードがある場合' do
      it "有効" do
        user = FactoryBot.build(:user)
        expect(user).to be_valid
      end
    end
    describe '名前' do
      context '名前がない場合' do
        it "無効" do
          user = FactoryBot.build(:user, name: nil)
          # valid?メソッドを呼び出すとエラー検証が行える。次行のerrorsメソッドを使うために必要。
          user.valid?
          # valid?メソッドでfalseであれば、user.errosでどんなerrorを持っているか返してくれる。今回は特に[:name]のエラーがみたいのでexpect()内部で指定する。
          expect(user.errors[:name]).to include("を入力してください")
        end
      end
      context '名前の長さが21文字以上の場合' do
        it "無効" do
          user = FactoryBot.build(:user, name:  "a" * 21)
          user.valid?
          expect(user.errors[:name]).to include("は20文字以内で入力してください")
        end
      end
    end
    describe 'メールアドレス' do
      context 'メールアドレスがない場合' do
        it "無効"  do
          user = FactoryBot.build(:user, email: nil)
          user.valid?
          expect(user.errors[:email]).to include("を入力してください")
        end
      end
      context 'メールアドレスが重複している場合' do
        it "無効" do
          # FactoryBot.createとFactoryBot.buildの違いは、テストDBに値を保持するかどうか。createは値を保持して、buildはオブジェクト化するだけ。
          # emailの重複を確認したいので、DBに値が必要
          user1 = FactoryBot.create(:user)
          user2 = FactoryBot.build(:user)
          user2.valid?
          expect(user2.errors[:email]).to include("はすでに存在します")
        end
      end
    end
    describe 'パスワード' do
      context 'パスワードがない場合' do
        it "無効" do
          user = FactoryBot.build(:user, password: nil)
          user.valid?
          expect(user.errors[:password]).to include("を入力してください")
        end
      end
      context 'パスワードが5文字以下の場合' do
        it "無効" do
          user = FactoryBot.build(:user, password: "a" * 5)
          user.valid?
          expect(user.errors[:password]).to include("は6文字以上で入力してください")
        end
      end
      context 'パスワードが13文字以上の場合' do
        it "無効" do
          user = FactoryBot.build(:user, password: "a" * 13)
          user.valid?
          expect(user.errors[:password]).to include("は12文字以内で入力してください")
        end
      end
    end
  end
end
