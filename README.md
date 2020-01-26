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

## Contributing

For information on how to contribute to this project, check out the
[contributing guidelines](./CONTRIBUTING.md).

## Questions?

If you have any questions about, or if any of the documentation is unclear,
please feel free to reach out through a
[new issue](https://github.com/TEECOM/slack_sign_in/issues/new?labels=documentation%20:writing_hand:).

:smiley_cat:
