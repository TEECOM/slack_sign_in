require "test_helper"

class SlackSignIn::IdentityTest < ActiveSupport::TestCase
  test "exposing a unique ID" do
    params = identity_params(user_id: "uid123", team_id: "tid123")

    identity = SlackSignIn::Identity.new(params)

    assert_equal "tid123-uid123", identity.unique_id
  end

  test "exposing the user's team ID" do
    params = identity_params(team_id: "tid123")

    identity = SlackSignIn::Identity.new(params)

    assert_equal "tid123", identity.team_id
  end

  test "exposing the user's ID" do
    params = identity_params(user_id: "uid123")

    identity = SlackSignIn::Identity.new(params)

    assert_equal "uid123", identity.user_id
  end

  test "exposing the user's name" do
    params = identity_params(user: {name: "User Name"})

    identity = SlackSignIn::Identity.new(params)

    assert_equal "User Name", identity.name
  end

  test "exposing the user's email" do
    params = identity_params(user: {email: "test@email.com"})

    identity = SlackSignIn::Identity.new(params)

    assert_equal "test@email.com", identity.email
  end

  test "exposing the user's avatar" do
    params = identity_params(user: {image_48: "48x48-image"})

    identity = SlackSignIn::Identity.new(params)

    assert_equal "48x48-image", identity.avatar
  end

  test "exposing the user's avatar in different sizes" do
    params = identity_params(user: {image_512: "512x512-image"})

    identity = SlackSignIn::Identity.new(params)

    assert_equal "512x512-image", identity.avatar(size: 512)
  end

  private

  def identity_params(params)
    params.to_json
  end
end
