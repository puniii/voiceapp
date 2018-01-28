class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :show]

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "登録完了しました"
      redirect_to user_path(@user.id)
    
    else
      render 'new'
    end 
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  
  private
  def user_params
      params.require(:user).permit(:name, :email, :password,:password_confirmation)
  end
  
  def logged_in_user
    unless @current_user #ログイン中のuserでない場合は、ログイン画面へリダイレクト
      flash[:referer] = 'ログインしてください'
      render new_session_path
    end
  end
end