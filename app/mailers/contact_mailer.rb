class ContactMailer < ApplicationMailer
  def voice_mail(voice)
    @voice = voice
    @user_email = @voice.user.email
    mail to: @user_email , subject: "投稿完了しました"
  end
  
  def contact_mail(contact)
    @contact = contact
    @contact_email = @contact.email
    mail to: @contact_email , subject: "お問い合わせを受付しました"
  end  
end
