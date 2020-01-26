module SlackSignIn::Authorization
  extend ActiveSupport::Concern

  private

  def slack_authorization
    @_result ||= SlackSignIn::Result.new(flash[:slack_sign_in])
  end
end
