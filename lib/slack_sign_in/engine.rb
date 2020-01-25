require "oauth2"

module SlackSignIn
  class Engine < ::Rails::Engine
    isolate_namespace SlackSignIn

    config.slack_sign_in = ActiveSupport::OrderedOptions.new

    initializer "slack_sign_in.config" do |app|
      config.after_initialize do
        SlackSignIn.client_id = config.slack_sign_in.client_id
        SlackSignIn.client_secret = config.slack_sign_in.client_secret
        SlackSignIn.scopes = config.slack_sign_in.scopes || SlackSignIn::DEFAULT_SCOPES
      end
    end

    initializer "slack_sign_in.mount" do |app|
      app.routes.prepend do
        mount SlackSignIn::Engine, at: app.config.slack_sign_in.root || "slack_sign_in"
      end
    end
  end
end
