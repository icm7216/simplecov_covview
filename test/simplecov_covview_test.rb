# frozen_string_literal: true

require "test_helper"
class SimplecovCovviewTest < Test::Unit::TestCase

  self.test_order = :defined

  sub_test_case "defined?" do

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

    test "Resultfile defined" do
      assert do
        defined? SimplecovCovview::CovView::Resultfile
      end
    end

  end

  sub_test_case "formatter" do

    setup do
      result_foo = {
        source_fixture("foo.rb") => { "lines" => [nil, 1, 10, 10, nil, 0, nil, nil, nil, 11] },
      }
      result = SimpleCov::Result.new(result_foo)
      covview = SimplecovCovview::CovView.new(result)
      covview.formatter
      @src_files_list = covview.src_files_list[0]
    end

    # result_file.status of @src_files_list
    data( "filename"    => ["foo.rb", :filename],
          "line_digit"  => [2, :line_digit],
          "cov_digit"   => [2, :cov_digit],
          "covered"     => [4, :covered],
          "missed"      => [1, :missed])

    def test_status(data)
      expected, target = data
      actual = @src_files_list[target]
      assert_equal(expected, actual)
    end

    # contents of @src_files_list, source code and coverage.
    data( 
      "line number"   => [[1,       2,          3,          4,          5,        6,        7,        8,        9,        10        ], :num],
      "status"=> [["never", "covered",  "covered",  "covered",  "never",  "missed", "never",  "never",  "never",  "covered" ], :status],
      "coverage"   => [["-",     "1",        "10",       "10",       "-",      "0",      "-",      "-",      "-",      "11"      ], :cov],
      "source code"   => [[ "# foo.rb\r\n", 
                    "def foo(n)\r\n", 
                    "  if n <= 10\r\n", 
                    "    p \"n < 10\"\r\n", 
                    "  else\r\n", 
                    "    p \"n >= 10\"\r\n", 
                    "  end\r\n", 
                    "end\r\n", 
                    "\r\n", 
                    "(1..10).each {|x| foo(x)}\r\n"], :src]
    )
    def test_contents(data)
      contents = @src_files_list[:contents]
      expected, target = data
      actual = contents.map{ |x| x[target] }
      assert_equal(expected, actual)
    end

  end
end

