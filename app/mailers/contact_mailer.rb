class ContactMailer < ApplicationMailer
  def contact_mailer(user)
    #以下編集
    @user = user
    
    mail to: user.mail, subject: "投稿完了のお知らせ"
  end
end
