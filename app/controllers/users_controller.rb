class UsersController < ApplicationController
  #before_filter :require_login
  #before_action :set_voice, only: [:show, :edit, :update, :destroy]
  #before_action :set_user,       only: [:edit, :destroy]
  #before_action :current_user, only: [:new, :edit, :show]
  #before_action :correct_user,   only: [:edit, :update, :destroy]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
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
                                 
end