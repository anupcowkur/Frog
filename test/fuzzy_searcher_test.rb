require 'test_helper'
require 'fuzzy_searcher'
require 'exiter'

class TestFuzzySearcher < Minitest::Test
  def setup
    file = File.open(File.expand_path('../test/fixtures/test_links_subset.js', File.dirname(__FILE__)), "r")
    @links = file.read.split("\n")
    file.close
  end

  def test_that_it_errors_out_on_not_finding_search_term
    Exiter.any_instance.expects(:exit_due_to_doc_not_found)
    FuzzySearcher.new.search("goooo", @links)
  end

  def test_that_it_displays_correct_options_on_finding_search_term
    TestHelper::fake_io("1") do
      FuzzySearcher.new.search("running", @links)
      assert_equal "Enter the index of the class you want. ex: Enter 1 if you wish to select the first option.\n1: android.app.ActivityManager.RunningAppProcessInfo\n2: android.app.ActivityManager.RunningServiceInfo\n3: android.app.ActivityManager.RunningTaskInfo\n", $stdout.string
    end
  end

  def test_that_it_returns_correct_url_when_user_selects_an_index
    TestHelper::fake_io("1") do
      assert_equal "https://developer.android.com/reference/android/app/ActivityManager.RunningAppProcessInfo.html", FuzzySearcher.new.search("running", @links)
    end
  end

  def test_that_it_errors_out_when_user_selects_an_incorrect_index
    Exiter.any_instance.expects(:exit_due_to_incorrect_index)
    TestHelper::fake_io("99") do
      FuzzySearcher.new.search("running", @links)
    end
  end
end
