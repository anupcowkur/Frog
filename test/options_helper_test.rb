require 'test_helper'
require 'options_helper'
require 'exiter'

class TestOptionsHelper < Minitest::Test

  def test_that_it_displays_help_and_exits
    TestHelper::fake_io("") do
      ARGV.clear
      ARGV << "-h"

      mock_exiter = Minitest::Mock.new
      mock_exiter.expect :exit_after_showing_help, nil

      OptionsHelper.new(mock_exiter).get_options
    
      assert_equal "Usage: droiddocs.rb [options] search_term\n    -e, --exact                      Search for the exact class\n    -h, --help                       Displays Help\n", $stdout.string
      mock_exiter.verify
    end
  end

  def test_that_it_sets_exact_search_option
    TestHelper::fake_io("") do      
      ARGV.clear
      ARGV << "-e"
      
      options = OptionsHelper.new(Exiter.new).get_options

      assert_equal true, options[:exact]
    end
  end
end
