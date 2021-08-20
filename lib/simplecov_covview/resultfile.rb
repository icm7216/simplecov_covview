
module SimplecovCovview
  class CovView
    class Resultfile
      # The Resultfile class stores source file's information.
      #
      # @param [Hash] file SimpleCov::SourceFile
      def initialize(file)
        @file = file
      end

      def covered_count
        @file.covered_lines.count
      end

      def missed_count
        @file.missed_lines.count
      end

      def line_digit
        @file.lines.count.to_s.size
      end

      def cov_digit
        @file.coverage_data["lines"].map(&:to_i).max.to_s.size
      end

      def status
        {
          filename: File.basename(@file.filename),
          line_digit: line_digit,
          cov_digit: cov_digit,
          covered: covered_count,
          missed: missed_count,
        }
      end

    end
  end
end
