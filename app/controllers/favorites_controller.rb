class FavoritesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

    
  def create
    favorite = current_user.favorites.create(voice_id: params[:voice_id])
    redirect_to voices_path, notice: "いいね！しました"
  end
  
  
  def destroy
    favorite = current_user.favorites.find_by(voice_id: params[:voice_id]).destroy
    redirect_to voice_path, notice: "いいね！を取り消ししました"
  end
  
  private

  def logged_in_user
    unless  current_user
      flash[:referer] = 'ログインしてください'
      render new_session_path
    end
  end
  
  
end
