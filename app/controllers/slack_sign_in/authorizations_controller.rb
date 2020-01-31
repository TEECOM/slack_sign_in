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

  def proceed_to
    params.require(:proceed_to)
  end

  def state
    @_state ||= SecureRandom.urlsafe_base64(24)
  end
end
