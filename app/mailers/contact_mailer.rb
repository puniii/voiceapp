class ContactMailer < ApplicationMailer
  def voice_mail(voice)
    @voice = voice
    @user_email = @voice.user.email
    #binding.pry
    mail to: @user_email , subject: "投稿完了しました"
  end
end
