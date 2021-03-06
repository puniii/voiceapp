class UsersController < ApplicationController

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
    @favorites_voices = @user.favorite_voices
  end
  
  private
  def user_params
      params.require(:user).permit(:name, :email, :password,:password_confirmation,:image)
  end
end