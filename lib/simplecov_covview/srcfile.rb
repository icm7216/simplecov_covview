
module SimplecovCovview
  class CovView
    class Srcfile
      # Create coverage header from @src_files_list.
      #
      # @param [Hash] src_file @src_files_list
      def initialize(src_file)
        @src_file = src_file
      end

      def filename
        @src_file[:filename]
      end

      def status
        {
          covered: @src_file[:covered],
          missed: @src_file[:missed],
        }
      end

      def title
        "line#   status   count  code"
      end

      def header
        [
          "\n----- file => #{filename} -----",
          "#{status[:covered]} lines covered and #{status[:missed]} lines missed.",
          title,
        ]
      end
    end
  end
end
