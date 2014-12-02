class ApplicationMailer < ActionMailer::Base
  include MailerHelper
  helper MailerHelper

  default from: proc { from }

  protected

  def from
     "no-reply@#{domain}"
  end
end
