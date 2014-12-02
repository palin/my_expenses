Rails.application.config.middleware.use OmniAuth::Builder do
  app_id = FACEBOOK_CONFIG['app_id'] || ENV['fb_app_id']
  secret = FACEBOOK_CONFIG['secret'] || ENV['fb_secret']
  provider :facebook, app_id, secret, {:scope => 'email,user_about_me'}
end