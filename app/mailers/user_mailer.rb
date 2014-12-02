class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    @url  = "http://#{domain}/login"
    mail(to: @user.email, subject: I18n.t('mailers.user_mailer.welcome_email.subject'))
  end
end
