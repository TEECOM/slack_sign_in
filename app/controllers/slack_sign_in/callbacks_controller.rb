class SlackSignIn::CallbacksController < SlackSignIn::ApplicationController
  def show
    return head(:bad_request) if proceed_to_missing?

    redirect_to proceed_to_url, flash: {slack_sign_in: slack_sign_in_result}
  end

  private

  def proceed_to_missing?
    proceed_to_url.blank?
  end

  def proceed_to_url
    flash[:proceed_to]
  end

  def slack_sign_in_result
    if valid_request? && params[:code].present?
      {success: identity_information}
    else
      {error: error_for(params[:error])}
    end
  rescue OAuth2::Error => error
    {error: error_for(error.code)}
  end

  def valid_request?
    flash[:state].present? && params[:state] == flash[:state]
  end

  def identity_information
    client.auth_code.get_token(params[:code]).params
  end

  def error_for(error)
    error || "invalid_request"
  end
end
