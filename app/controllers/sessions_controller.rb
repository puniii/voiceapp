class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
    #session[:user_id] = user.id
    log_in user
    redirect_to new_voice_path(user.id)
    
    else
    flash.now[:danger] = 'ログインできませんでした'
    render 'new'
    end
  end
  
  def destroy #まだ未実装
    log_out if logged_in?
    session.delete(:user_id)
    flash[:notice] = 'ログアウトしました'
    redirect_to root_url
  end
end
