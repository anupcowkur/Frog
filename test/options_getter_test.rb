require 'test_helper'

class TestOptionsHelper < Minitest::Test
  def test_that_it_displays_help_and_exits
    TestHelper::fake_io("") do
      ARGV.clear
      ARGV << "-h"

      Exiter.any_instance.expects(:exit_after_showing_help)
      expected_stdout_string = "Usage: droiddocs.rb [options] search_term\n    -e, --exact                      Search for the exact class\n    -h, --help                       Displays Help\n"

      OptionsGetter.new.get_options

      assert_equal expected_stdout_string, $stdout.string
    end
  end

  def test_that_it_sets_exact_search_option
    TestHelper::fake_io("") do
      ARGV.clear
      ARGV << "-e"

      options = OptionsGetter.new.get_options

      assert_equal true, options[:exact]
    end
  end
end
