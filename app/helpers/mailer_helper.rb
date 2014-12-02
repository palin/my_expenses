module MailerHelper
  def domain
    if Rails.env.production?
      "myexpenses.app.com"
    else
      "myexpenses-#{Rails.env}.app.com"
    end
  end
end