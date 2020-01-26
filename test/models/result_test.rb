require "test_helper"

class SlackSignIn::ResultTest < ActiveSupport::TestCase
  test "a successful sign in" do
    result = SlackSignIn::Result.new("success" => {"user_id" => "u123"})

    assert result.successful?
    assert_equal "u123", result.identity.user_id
    assert_nil result.error
  end

  test "an unsuccessful sign in" do
    result = SlackSignIn::Result.new("error" => "access_denied")

    refute result.successful?
    assert_nil result.identity
    assert_equal "access_denied", result.error
  end

  test "an empty sign in result" do
    result = SlackSignIn::Result.new(nil)

    refute result.successful?
    assert_nil result.identity
    assert_equal "invalid_request", result.error
  end
end
