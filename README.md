# Slack Sign-In for Rails

The goal of this gem is to get you up and running with Slack sign-ins:

  - with minimal configuration
  - as quickly as possible
  - without sacrificing on long-term stability and maintainability

The creation of this gem was heavily inspired by the awesome
[basecamp/google_sign_in](https://github.com/basecamp/google_sign_in) project,
both in its aspirations and in its implementation. If you need to add Google
sign-in to your Rails project, definitely check it out!

This project adheres to the Contributor Covenant
[code of conduct](./CODE_OF_CONDUCT.md). By participating, you are expected to
uphold this code. Please report unacceptable behavior to
research@teecom.com.

## Installation

Add `slack_sign_in` to your Rails app's Gemfile and run `bundle install`:

```ruby
gem "slack_sign_in"
```

*Note:* This gem requires Rails 5.2 or newer.

## Creating a Slack App

Before getting started, you'll likely need to set up a Slack application:

  1. Go to the [Slack applications list](https://api.slack.com/apps)

  2. Either click **Create New App**, or select an existing application

  3. Take note of your app's **Client ID** and **Client Secret**

     <details>
       <summary>Slack app credentials visual guide :framed_picture:</summary>

       ![Slack App Credentials](./doc/images/app_credentials.png)
     </details>

  4. Under the **OAuth & Permissions** tab, add your app's callback URLs to the
     list of **Redirect URLs** section.

     This gem adds a single OAuth callback to your Rails application at
     `/slack_sign_in/callback`. For a production application, you might add a
     redirect URL of:

     ```
     https://www.example.com/slack_sign_in/callback
     ```

     To sign in with Slack in development, you would likely also add a redirect
     URL for your local environment. Something like:

     ```
     http://localhost:3000/slack_sign_in/callback
     ```

     <details>
       <summary>Slack app redirect URLs visual guide :framed_picture:</summary>

       ![Slack App Redirect URLs](./doc/images/redirect_urls.png)
     </details>

## Configuration

With your Slack application set up, the next step is to configure your Rails
app to use it. Run `rails credentials:edit` to edit your app's
[encrypted credentials](https://guides.rubyonrails.org/security.html#custom-credentials)
and add the following:

```yaml
slack_sign_in:
  client_id: "[Your client ID here]"
  client_secret: "[Your client secret here]"
```

You're all set to use Slack sign-in now. The gem will automatically use these
client credentials! :tada:

Alternatively, you can provide the Slack credentials through an initializer
and environment variables:

```ruby
# config/initializers/slack_sign_in.rb
Rails.application.configure do
  config.slack_sign_in.client_id = ENV.fetch("SLACK_CLIENT_ID")
  config.slack_sign_in.client_secret = ENV.fetch("SLACK_CLIENT_SECRET")
end
```

**:warning: Important:** Take care to protect your client secret. It's a secret
after all!

### Scopes

By default, this gem will request the following scopes from Slack:

  - `identity.basic`
  - `identity.email`
  - `identity.avatar`

If these scopes don't suit your particular need, you can configure the gem to
use any of the
[supported Slack scopes](https://api.slack.com/docs/sign-in-with-slack#identity_scopes)
through an initializer:

```ruby
# config/initializers/slack_sign_in.rb
Rails.application.configure do
  config.slack_sign_in.scopes = %w(identity.basic identity.team)
end
```

### Mounting Root

By default, this gem will mount its routes at `/slack_sign_in`. If this doesn't
suit your needs, it can be configured through an initializer:

```ruby
# config/initializers/slack_sign_in.rb
Rails.application.configure do
  config.slack_sign_in.root = "sso/slack"
end
```

In this example, the gem would add a callback URL of `/sso/slack/callback`
rather than the default of `/slack_sign_in/callback`.

## Contributing

For information on how to contribute to this project, check out the
[contributing guidelines](./CONTRIBUTING.md).

## Questions?

If you have any questions about, or if any of the documentation is unclear,
please feel free to reach out through a
[new issue](https://github.com/TEECOM/slack_sign_in/issues/new?labels=documentation%20:writing_hand:).

:smiley_cat:
