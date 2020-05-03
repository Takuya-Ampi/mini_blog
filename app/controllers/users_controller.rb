class UsersController < ApplicationController
  #ユーザー一覧ページ
  def index
    @users = User.all
  end
  #新規登録ページ
  def new
    @user = User.new
  end
  #ユーザー詳細ページ
  def show
    @user = User.find_by(id: params[:id])
  end
  #ユーザー編集ページ
  def edit
    @user = User.find_by(id: params[:id])
  end
  #新規登録(post)
  def create
    @user = User.new(name: params[:name], email: params[:email], password: params[:password])
    @user.save
    #ユーザー一覧にリダイレクト
      redirect_to("/users/index")
  end
  #ユーザー削除(post)
  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    #ユーザー一覧にリダイレクト
      redirect_to("/users/index")
  end
end
