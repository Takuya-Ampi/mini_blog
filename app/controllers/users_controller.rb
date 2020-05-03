class UsersController < ApplicationController
  #ユーザー一覧ページ
  def index
  end
  #新規登録ページ
  def new
    @user = User.new
  end
  #新規登録(post)
  def create
    @user = User.new(name: params[:name], email: params[:email], password: params[:password])
    @user.save
  end
end
