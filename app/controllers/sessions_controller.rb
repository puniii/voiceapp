class SessionsController < ApplicationController
  before_action :logged_in_user, only: [:new, :edit, :show]
  
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
    session[:user_id] = user.id
    #log_in user
    redirect_to new_voice_path(user.id)
    
    else
    flash.now[:danger] = 'ログインできませんでした'
    render 'new'
    end
  end
  
  def destroy
    session.delete(:user_id)
    flash[:notice] = 'ログアウトしました'
    redirect_to new_session_path
  end
  
  
  private
  def logged_in_user
    unless @current_user #ログイン中のuserでない場合は、ログイン画面へリダイレクト
      flash[:referer] = 'ログインしてください'
      render new_session_path
    end
  end
end
