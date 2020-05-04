class UsersController < ApplicationController

  before_action :authenticate_user, {only: [:index, :show, :edit, :update, :destroy, :logout]}
  before_action :forbid_login_user, {only: [:new, :login_form, :create, :login]}
  before_action :ensure_correct_user, {only: [:edit, :update]}

  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      #トップページにリダイレクト
      redirect_to("/")
  end
  end
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
  #ログインページ
  def login_form
  end

  #ユーザー削除(post)
  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    flash[:notice] = "ユーザー情報を削除しました"
    #ユーザー一覧にリダイレクト
      redirect_to("/users/index")
  end
  #ユーザー編集(post)
  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]
    if @user.save
      flash[:notice] = "編集が完了しました"
    #ユーザー一覧にリダイレクト
      redirect_to("/users/index")
    else
      render("users/edit")
    end
  end
  #新規登録(post)
  def create
    @user = User.new(name: params[:name], email: params[:email], password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録が完了しました"
    #ユーザー一覧にリダイレクト
      redirect_to("/users/index")
    else
      render("users/new")
    end
  end
  #ログイン(post)
  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      # 変数sessionに、ログインに成功したユーザーのidを代入
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      #トップページにリダイレクト
      redirect_to("/")
    else
      @error_message = "メールアドレスかパスワードが間違っています"
      @input_email = params[:email]
      @input_password = params[:password]
      render("users/login_form")
    end
  end
  #ログインアウト
  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    #リダイレクト
    redirect_to("/login")
  end
end
