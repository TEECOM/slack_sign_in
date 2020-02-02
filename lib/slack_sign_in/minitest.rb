require "minitest/mock"

module SlackSignIn::SystemTestHelpers
  def mock_successful_authorization(identity_info, &block)
    SlackSignIn::TestClient.stub(
      :identity_info,
      SlackSignIn::TestClient.identity_info.merge(identity_info),
      &block
    )
  end

  def mock_failed_authorization(error, &block)
    SlackSignIn::TestClient.stub(:error_code, error, &block)
  end
end
