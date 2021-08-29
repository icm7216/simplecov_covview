module SimplecovCovview
  class CovView
    attr_accessor :src_files_list

    def initialize(result)
      @result = result
      @src_files_list = nil
    end

    def formatter
      @src_files_list = @result.source_files.map do |file|
        contents = file.lines.map do |line|
          coverage = line.coverage.nil? ? "-" : "#{line.coverage}"
          {
            num: line.number,
            status: line.status,
            cov: coverage,
            src: line.src,
          }
        end

        result_file = SimplecovCovview::CovView::Resultfile.new(file)
        file_contents = { contents: contents }
        file_contents.merge(result_file.status)
      end

      self
    end

    def render
      @src_files_list.each do |src_file|
        source_file = SimplecovCovview::CovView::Srcfile.new(src_file)
        puts source_file.header

        src_file[:contents].each do |line|
          row = SimplecovCovview::CovView::Srcfile::Line.new(line, src_file)
          puts row.colorize_contents
        end
      end
    end
  end
end
