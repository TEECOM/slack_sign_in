require "test_helper"

class SlackSignIn::Test < ActiveSupport::TestCase
  test "configured values" do
    assert_equal FAKE_SLACK_CLIENT_ID, SlackSignIn.client_id
    assert_equal FAKE_SLACK_CLIENT_SECRET, SlackSignIn.client_secret
  end
end
