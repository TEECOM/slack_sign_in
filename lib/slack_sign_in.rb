require "slack_sign_in/engine"

module SlackSignIn
  DEFAULT_SCOPES = %w[identity.basic identity.email identity.avatar]

  AUTHORIZE_URL = "https://slack.com/oauth/v2/authorize"
  TOKEN_URL = "https://slack.com/api/oauth.v2.access"

  mattr_accessor :client_id, :client_secret
  mattr_accessor :scopes, :client
end
