# frozen_string_literal: true

require "test_helper"

class SimplecovCovviewTest < Test::Unit::TestCase
  self.test_order = :defined

  test "VERSION defined" do
    assert do
      defined? SimplecovCovview::VERSION
    end
  end

  test "Formatter defined" do
    assert do
      defined? SimpleCov::Formatter::CovView
    end
  end

end
