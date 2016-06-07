require 'test_helper'
require 'exact_searcher.rb'

class TestExactSearcher < Minitest::Test
  def setup
    file = File.open(File.expand_path('../test/fixtures/test_links.js', File.dirname(__FILE__)), "r")
    @links = file.read.split("\n")
    file.close
  end

  def test_that_it_aborts_with_error_on_not_finding_search_term 
    assert_raises SystemExit do
      ExactSearcher.new.search(@links, "goooo")
    end
  end

  def test_that_it_launches_correct_url_on_finding_search_term
    assert_equal "https://developer.android.com/reference/android/R.animator.html", ExactSearcher.new.search(@links, "Animator")
  end
end
