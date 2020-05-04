class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_current_user
  def set_current_user
    #変数にセッションidと一致するユーザー情報を格納する
    @current_user = User.find_by(id: session[:user_id])
  end
end
