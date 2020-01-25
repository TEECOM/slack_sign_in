module SlackSignIn::LinkHelper
  def slack_sign_in_link(text = nil, proceed_to:, **options, &block)
    options = options.merge(method: :post)
    auth_url = slack_sign_in.authorization_path(proceed_to: proceed_to)

    if text
      link_to(text, auth_url, options)
    elsif block_given?
      link_to(auth_url, options, &block)
    else
      link_to(auth_url, options) { slack_sign_in_image }
    end
  end

  def slack_sign_in_image
    image_tag(
      "https://platform.slack-edge.com/img/sign_in_with_slack.png",
      alt: "Sign in with Slack",
      height: 40,
      width: 172,
      srcset: {
        "https://platform.slack-edge.com/img/sign_in_with_slack.png" => "1x",
        "https://platform.slack-edge.com/img/sign_in_with_slack@2x.png" => "2x",
      },
    )
  end
end
