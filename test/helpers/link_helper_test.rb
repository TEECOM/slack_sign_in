require "test_helper"

class SlackSignIn::LinkHelperTest < ActionView::TestCase
  test "generating a login link" do
    link = slack_sign_in_link(proceed_to: "https://www.example.com/sessions")

    assert_dom_equal <<-HTML, link
      <a rel="nofollow" data-method="post" href="/slack_sign_in/authorization?proceed_to=https%3A%2F%2Fwww.example.com%2Fsessions">
        #{slack_sign_in_image}
      </a>
    HTML
  end

  test "generating a login link with options" do
    link = slack_sign_in_link(
      proceed_to: "https://www.example.com/sessions",
      class: "text-blue-400",
    )

    assert_dom_equal <<-HTML, link
      <a class="text-blue-400" rel="nofollow" data-method="post" href="/slack_sign_in/authorization?proceed_to=https%3A%2F%2Fwww.example.com%2Fsessions">
        #{slack_sign_in_image}
      </a>
    HTML
  end

  test "generating a login link with text" do
    link = slack_sign_in_link(
      "Sign In!",
      proceed_to: "https://www.example.com/sessions",
    )

    assert_dom_equal <<-HTML, link
      <a rel="nofollow" data-method="post" href="/slack_sign_in/authorization?proceed_to=https%3A%2F%2Fwww.example.com%2Fsessions">
        Sign In!
      </a>
    HTML
  end

  test "generating a login link with text and options" do
    link = slack_sign_in_link(
      "Sign In!",
      proceed_to: "https://www.example.com/sessions",
      data: {confirm: "You sure?"},
    )

    assert_dom_equal <<-HTML, link
      <a data-confirm="You sure?" rel="nofollow" data-method="post" href="/slack_sign_in/authorization?proceed_to=https%3A%2F%2Fwww.example.com%2Fsessions">
        Sign In!
      </a>
    HTML
  end

  test "generating a login link with a block" do
    link = slack_sign_in_link(proceed_to: "https://www.example.com/sessions") {
      "Some Block Text!"
    }

    assert_dom_equal <<-HTML, link
      <a rel="nofollow" data-method="post" href="/slack_sign_in/authorization?proceed_to=https%3A%2F%2Fwww.example.com%2Fsessions">
        Some Block Text!
      </a>
    HTML
  end

  test "generating a login link with a block and options" do
    link = slack_sign_in_link(proceed_to: "https://www.example.com/sessions", class: "rounded") {
      image_tag("my_cool_image.png")
    }

    assert_dom_equal <<-HTML, link
      <a class="rounded" rel="nofollow" data-method="post" href="/slack_sign_in/authorization?proceed_to=https%3A%2F%2Fwww.example.com%2Fsessions">
        <img src="/images/my_cool_image.png" />
      </a>
    HTML
  end

  test "generating the sign in with slack image" do
    assert_dom_equal <<-HTML, slack_sign_in_image
      <img alt="Sign in with Slack" height="40" width="172" srcset="https://platform.slack-edge.com/img/sign_in_with_slack.png 1x, https://platform.slack-edge.com/img/sign_in_with_slack@2x.png 2x" src="https://platform.slack-edge.com/img/sign_in_with_slack.png" />
    HTML
  end
end
