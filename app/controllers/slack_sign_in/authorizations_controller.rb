class SlackSignIn::AuthorizationsController < SlackSignIn::ApplicationController
  def create
    redirect_to slack_login_url, flash: {proceed_to: proceed_to, state: state}
  end

  private

  def slack_login_url
    client.auth_code.authorize_url(scope: scopes, state: state)
  end

  def scopes
    SlackSignIn.scopes.join(" ")
  end

  def client
    @_client ||= OAuth2::Client.new(
      SlackSignIn.client_id,
      SlackSignIn.client_secret,
      authorize_url: "https://slack.com/oauth/authorize",
      token_url: "https://slack.com/api/oauth.access",
      redirect_uri: callback_url,
    )
  end

  def proceed_to
    params.require(:proceed_to)
  end

  def state
    @_state ||= SecureRandom.base64(24)
  end
end
