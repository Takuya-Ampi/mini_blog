class PostsController < ApplicationController

  #投稿一覧ページ
  def index
    @posts = Post.all
  end
  #新規投稿ページ
  def new
  end
  #投稿詳細ページ
  def show
    @post = Post.find_by(id: params[:id])
  end
  #投稿編集ページ
  def edit
    @post = Post.find_by(id: params[:id])
  end

  #新規投稿(post)
  def create
    @post = Post.new(content: params[:content])
    @post.save
    #投稿一覧にリダイレクト
    redirect_to("/posts/index")
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
    @post.save
    flash[:notice] = "投稿を編集しました"
    redirect_to("/posts/index")
  end

end
