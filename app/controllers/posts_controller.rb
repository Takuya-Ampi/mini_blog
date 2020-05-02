class PostsController < ApplicationController

  #投稿一覧ページ
  def index
    @posts = Post.all
  end
end
