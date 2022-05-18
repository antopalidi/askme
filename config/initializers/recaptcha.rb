Recaptcha.configure do |config|
  config.site_key  = ENV['RECAPTCHA_ASKME_SITE_KEY']
  config.secret_key = ENV['RECAPTCHA_ASKME_SECRET_KEY']
  # config.secret_key = ENV['RECAPTCHA_ENTERPRISE']
  # config.secret_key = ENV['RECAPTCHA_ENTERPRISE_API_KEY']
  # config.secret_key = ENV['RECAPTCHA_ENTERPRISE_PROJECT_ID']

end
