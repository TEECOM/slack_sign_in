require "test_helper"

class SlackSignIn::CallbackTest < ActionDispatch::IntegrationTest
  test "receiving an authorization code" do
    come_from_authorization(proceed_to: "http://www.example.com/sessions")
    stub_success_for "code", user_id: "u123"

    get slack_sign_in.callback_url(code: "code", state: flash[:state])

    assert_redirected_to "http://www.example.com/sessions"
    assert_equal "u123", flash[:slack_sign_in][:success]["user_id"]
    assert_nil flash[:slack_sign_in][:error]
  end

  test "receiving an authorization error" do
    come_from_authorization(proceed_to: "http://www.example.com/sessions")

    get slack_sign_in.callback_url(error: "invalid_scope", state: flash[:state])

    assert_redirected_to "http://www.example.com/sessions"
    assert_equal "invalid_scope", flash[:slack_sign_in][:error]
    assert_nil flash[:slack_sign_in][:success]
  end

  test "receiving no code or error from authorization" do
    come_from_authorization(proceed_to: "http://www.example.com/sessions")

    get slack_sign_in.callback_url(state: flash[:state])

    assert_redirected_to "http://www.example.com/sessions"
    assert_equal "invalid_request", flash[:slack_sign_in][:error]
    assert_nil flash[:slack_sign_in][:success]
  end

  test "receiving an access token request error" do
    come_from_authorization(proceed_to: "http://www.example.com/sessions")
    stub_error_for "code", error: "invalid_grant"

    get slack_sign_in.callback_url(code: "code", state: flash[:state])

    assert_redirected_to "http://www.example.com/sessions"
    assert_equal "invalid_grant", flash[:slack_sign_in][:error]
    assert_nil flash[:slack_sign_in][:success]
  end

  test "receiving no proceed_to URL from authorization" do
    get slack_sign_in.callback_url

    assert_response :bad_request
  end

  test "receiving a manufactured state" do
    come_from_authorization(proceed_to: "http://www.example.com/sessions")

    get slack_sign_in.callback_url(code: "code", state: "manufactured")

    assert_redirected_to "http://www.example.com/sessions"
    assert_equal "invalid_request", flash[:slack_sign_in][:error]
    assert_nil flash[:slack_sign_in][:success]
  end

  test "receiving an empty state" do
    come_from_authorization(proceed_to: "http://www.example.com/sessions")

    get slack_sign_in.callback_url(code: "code")

    assert_redirected_to "http://www.example.com/sessions"
    assert_equal "invalid_request", flash[:slack_sign_in][:error]
    assert_nil flash[:slack_sign_in][:success]
  end

  private

  def stub_success_for(code, **response_body)
    stub_token_request(
      code: code,
      status: 200,
      response: {access_token: "token123"}.merge(response_body),
    )
  end

  def stub_error_for(code, error:)
    stub_token_request(
      code: code,
      status: 418,
      response: {ok: false, error: error},
    )
  end

  def stub_token_request(code:, status:, response:)
    stub_request(:post, SlackSignIn::TOKEN_URL).with(
      body: {
        grant_type: "authorization_code",
        code: code,
        client_id: FAKE_SLACK_CLIENT_ID,
        client_secret: FAKE_SLACK_CLIENT_SECRET,
        redirect_uri: "http://www.example.com/slack_sign_in/callback",
      },
    ).to_return(
      status: status,
      headers: {"Content-Type": "application/json"},
      body: response.to_json,
    )
  end

  def come_from_authorization(proceed_to:)
    post slack_sign_in.authorization_url, params: {proceed_to: proceed_to}
    assert_response :redirect
  end
end
