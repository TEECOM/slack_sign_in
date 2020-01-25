module SlackSignIn
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def client
      @_client ||= OAuth2::Client.new(
        SlackSignIn.client_id,
        SlackSignIn.client_secret,
        authorize_url: "https://slack.com/oauth/authorize",
        token_url: "https://slack.com/api/oauth.access",
        redirect_uri: callback_url,
      )
    end
  end
end
