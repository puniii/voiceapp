class VoicesController < ApplicationController
  before_action :set_voice, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:new,:edit,:index]
  

  def index
    @voices = Voice.all
    
  end
  
  def tops
    @voice = Voice.new
  end
  
  def new
    @voice = Voice.new
    if params[:back]
      @voice = Voice.new(voice_params)
    else
      @voice = Voice.new
    end
  end
  
  def create
    @voice = Voice.new(voice_params)
    @voice.user_id = current_user.id
    
    respond_to do |format|
    
    if @voice.save
      ContactMailer.voice_mail(@voice).deliver_later
      format.html { redirect_to @voice, notice: '投稿しました' }
      format.json { render :show, status: :created, location: @voice }
      
    else
      render'new'
    end
    end
      
    if params[:cache][:image].present?
      @voice.image.retrieve_from_cache! params[:cache][:image]
      @voice.save!
    end
  end
  
  def show
    @voice = Voice.find(params[:id])
    @favorite = current_user.favorites.find_by(voice_id: @voice.id)
    
  end
  
  def edit
    @voice = Voice.find(params[:id])
  end
  
  def update
    @voice = Voice.find(params[:id])
      @voice.update(voice_params)
      redirect_to voices_path,notice: "つぶやきを編集しました！" 
  end
  
  def destroy
      @voice.destroy
        # @voice.update(voice_params)
        redirect_to voices_path,notice:"つぶやきを削除しました！"
  end
  
  def confirm
    @voice = Voice.new(voice_params)
    @voice.user_id = current_user.id
    
    render :new if @voice.invalid?
    
  end
  
  private
    def voice_params
      params.require(:voice).permit(:content, :user_id, :image)
    end
    
    def set_voice
      @voice = Voice.find(params[:id])
    end
    
    def logged_in_user
      unless  current_user #ログイン中のuserでない場合は、ログイン画面へリダイレクト
        flash[:referer] = 'ログインしてください'
        render new_session_path
      end
    end
    
end