$:.push File.expand_path("lib", __dir__)

require "slack_sign_in/version"

Gem::Specification.new do |spec|
  spec.name = "slack_sign_in"
  spec.version = SlackSignIn::VERSION
  spec.authors = ["Tom Schaefer"]
  spec.email = ["tommy.schaefer@teecom.com"]
  spec.homepage = "https://github.com/teecom/slack_sign_in"
  spec.summary = "Sign in (or up) with Slack for Rails applications"
  spec.license = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "oauth2", ">= 1.4.2"
  spec.add_dependency "rails", ">= 5.2.0"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "standardrb"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "webmock"
end
