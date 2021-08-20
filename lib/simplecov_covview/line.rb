module SimplecovCovview
  class CovView
    class Srcfile
      class Line
        # Create text for each line from @src_files_list.
        #
        # @param [Hash] line @src_files_list
        # @param [Hash] src_file @src_files_list
        def initialize(line, src_file)
          @line = line
          @src_file = src_file
        end

        def line_number
          @line[:num]
        end

        def line_width
          @src_file[:line_digit] < 4 ? 4 : @src_file[:line_digit]
        end

        def status
          @line[:status]
        end

        def cov_count
          @line[:cov]
        end

        def cov_width
          @src_file[:cov_digit] < 4 ? 4 : @src_file[:cov_digit] + 1
        end

        def source_code
          @line[:src]
        end

        def contents
          [
            sprintf("%#{line_width}s: ", line_number),
            sprintf("[%7s] ", status),
            sprintf("[%#{cov_width}s ] ", cov_count),
            source_code,
          ].join
        end
      end
    end
  end
end
