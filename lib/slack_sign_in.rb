require "slack_sign_in/engine"

module SlackSignIn
  DEFAULT_SCOPES = %w[identity.basic identity.email identity.avatar]

  mattr_accessor :client_id, :client_secret
  mattr_accessor :scopes
end
