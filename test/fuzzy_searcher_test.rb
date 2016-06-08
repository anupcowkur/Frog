require 'test_helper'
require 'fuzzy_searcher.rb'
require 'error_handler.rb'

class TestFuzzySearcher < Minitest::Test
  def setup
    file = File.open(File.expand_path('../test/fixtures/test_links.js', File.dirname(__FILE__)), "r")
    @links = file.read.split("\n")
    file.close
  end

  def test_that_it_errors_out_on_not_finding_search_term
    mock_error_handler = Minitest::Mock::new
    mock_error_handler.expect :handle_doc_not_found, nil
    FuzzySearcher.new(mock_error_handler).search("goooo", @links)
    mock_error_handler.verify
  end

  def test_that_it_displays_correct_options_on_finding_search_term
    fake_io("1") do
      FuzzySearcher.new(ErrorHandler.new).search("running", @links)
      assert_match "Enter the index of the class you want. ex: Enter 1 if you wish to select the first option.\n1: android.app.ActivityManager.RunningAppProcessInfo\n2: android.app.ActivityManager.RunningServiceInfo\n3: android.app.ActivityManager.RunningTaskInfo\n", $stdout.string
    end
  end

  def test_that_it_returns_correct_url_when_user_selects_an_index
    fake_io("1") do
      assert_equal "https://developer.android.com/reference/android/app/ActivityManager.RunningAppProcessInfo.html", FuzzySearcher.new(ErrorHandler.new).search("running", @links)
    end
  end

  def test_that_it_errors_out_when_user_selects_an_incorrect_index
    mock_error_handler = Minitest::Mock::new
    mock_error_handler.expect :handle_incorrect_index, nil
    fake_io("99") do
      FuzzySearcher.new(mock_error_handler).search("running", @links)
    end
    mock_error_handler.verify
  end
end
