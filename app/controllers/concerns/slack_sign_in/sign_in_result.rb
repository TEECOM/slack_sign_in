module SlackSignIn::SignInResult
  extend ActiveSupport::Concern

  private

  def slack_sign_in
    @_result ||= SlackSignIn::Result.new(flash[:slack_sign_in])
  end
end
