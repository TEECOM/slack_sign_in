Rails.application.configure do
  config.slack_sign_in.client_id = FAKE_SLACK_CLIENT_ID
  config.slack_sign_in.client_secret = FAKE_SLACK_CLIENT_SECRET
  config.slack_sign_in.scopes = FAKE_SLACK_SCOPES
end
