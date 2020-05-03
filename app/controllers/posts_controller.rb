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
  end

  #新規投稿(posts)
  def create
    @post = Post.new(content: params[:content])
    @post.save
    #投稿一覧にリダイレクト
    redirect_to("/posts/index")
  end
  #投稿削除(posts)
  def destroy
  end

end
