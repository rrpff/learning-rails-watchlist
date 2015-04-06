Rails.application.config.middleware.use OmniAuth::Builder do
    secrets = Rails.application.secrets
    provider :twitter, secrets['twitter_key'], secrets['twitter_secret']
end