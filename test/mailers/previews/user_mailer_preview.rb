# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def dupa
    @user = User.first
    @url  = 'http://dailyexpenses.co.uk/login'
    UserMailer.welcome_email(@user)
  end
end
