class PostsController < ApplicationController

  #投稿一覧ページ
  def index
    @posts = Post.all
  end
  #新規投稿ページ
  def new
  end
  #新規投稿(posts)
  def create
  end
end
