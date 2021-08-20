# frozen_string_literal: true

require_relative "simplecov_covview/version"
require_relative "simplecov_covview/formatter"
require_relative "simplecov_covview/resultfile.rb"
require_relative "simplecov_covview/srcfile.rb"
require_relative "simplecov_covview/line.rb"

module SimpleCov
  module Formatter
    class CovView
      def format(result)
        covview = SimplecovCovview::CovView.new(result)
        covview.formatter.render
      end
    end
  end
end
