ENV["RAILS_ENV"] = "test"

FAKE_SLACK_CLIENT_ID = "2258014216.917153113425"
FAKE_SLACK_CLIENT_SECRET = "fe0620e54862fg90d422fe6a097e1066"
FAKE_SLACK_SCOPES = ["test.scope", "test.scope2"]

require_relative "../test/dummy/config/environment"

require "rails/test_help"
require "webmock/minitest"

Minitest.backtrace_filter = Minitest::BacktraceFilter.new

class ActionView::TestCase
  private

  def assert_dom_equal(expected, actual, message = nil)
    super expected.remove(/(\A|\n)\s*/), actual, message
  end
end
