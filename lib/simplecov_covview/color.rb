module SimplecovCovview
  require 'rainbow/refinement'

  class CovView
    class Srcfile
      class Color
        using Rainbow

        # 8 colors colorscheme
        COLOR_8 = {
          covered: {
            color: :white, 
            background: :green
          },
          missed: {
            color: :white, 
            background: :red
          },
        }

        # 256 colors colorscheme
        COLOR_256 = {
          covered: {
            color: :black, 
            background: :lightgreen
          },
          missed: {
            color: :black, 
            background: :lightpink
          },
        }

        # Colorize the source file detail view
        # 
        # @param [Array] status @src_files_line
        # @param [Array] contents @src_files_line
        def initialize(status, contents)
          @status = status
          @contents = contents
          @colorscheme = {}
          set_colorscheme
        end


        def use_8colors?
          SimpleCov::Formatter::CovView.use_8color ||= false
        end

        def use_256colors?
          SimpleCov::Formatter::CovView.use_256color ||= false
        end


        def set_colorscheme
          @colorscheme = COLOR_8 if use_8colors?
          @colorscheme = COLOR_256 if use_256colors?
        end

        def covered_color
          @colorscheme[:covered][:color]
        end

        def covered_background
          @colorscheme[:covered][:background]
        end

        def missed_color
          @colorscheme[:missed][:color]
        end

        def missed_background
          @colorscheme[:missed][:background]
        end

        def colorize
          return @contents unless (use_8colors? || use_256colors?)

          case @status
          when "covered"
            out_str = Rainbow(@contents).color(covered_color).bg(covered_background)
          when "missed"
            out_str = Rainbow(@contents).color(missed_color).bg(missed_background)
          else
            out_str = @contents
          end

          out_str
        end

      end
    end
  end
end
