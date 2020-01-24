Rails.application.routes.draw do
  mount SlackSignIn::Engine => "/slack_sign_in"
end
