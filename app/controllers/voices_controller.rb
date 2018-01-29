class VoicesController < ApplicationController
  before_action :logged_in_user, only: [:new, :edit]

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

    if @voice.save
      redirect_to voices_path,notice:"投稿しました"
    else
      render'new'
    end
  end
  
  def show
    @voice = Voice.find(params[:id])
  end
  
  def edit
    @voice = Voice.find(params[:id])
  end
  
  def update
    @voice = Voice.find(params[:id])
    if @voice.update(voice_params)
       redirect_to voices_path,notice: "つぶやきを編集しました！"

    else
       render 'edit'
    end
  end
  
  def destroy
    @voice.destroy
    redirect_to voices_path, notice:"つぶやきを削除しました！"
  end
  
  def confirm
    @voice = Voice.new(voice_params)
    render :new if @voice.invalid?
  end
  
  private
    def voice_params
      params.require(:voice).permit(:content)
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
