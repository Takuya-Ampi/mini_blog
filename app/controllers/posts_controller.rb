class PostsController < ApplicationController

  before_action :authenticate_user
  before_action :ensure_correct_user , {only: [:edit, :update, :destroy]}

  #投稿一覧ページ
  def index
    @posts = Post.all
  end
  #新規投稿ページ
  def new
    @post = Post.new
  end
  #投稿詳細ページ
  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
  end
  #投稿編集ページ
  def edit
    @post = Post.find_by(id: params[:id])
  end

  #新規投稿(post)
  def create
    @post = Post.new(
      content: params[:content],
      # user_idの値をログインしているユーザーのidにする
      user_id: @current_user.id
      )
    if @post.save
      flash[:notice] = "投稿に成功しました"
      #投稿一覧にリダイレクト
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end
  #投稿削除(post)
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts/index")
  end
  #投稿編集(post)
  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/posts/index")
    else
      render("posts/edit")
    end
  end

  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
      # 投稿者のuser_idと現在ログインしているユーザーidが一致しない場合
      if @post.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end


end
