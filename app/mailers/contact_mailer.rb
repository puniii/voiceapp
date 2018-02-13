class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    @user_email = @contact.user.email
    mail to: @user_email , subject: "お問い合わせの確認メール"
  end
end
