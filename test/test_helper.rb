ENV["RAILS_ENV"] = "test"

require_relative "../test/dummy/config/environment"

require "rails/test_help"

Minitest.backtrace_filter = Minitest::BacktraceFilter.new
