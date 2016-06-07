require 'test_helper'
require 'exact_searcher.rb'

class TestExactSearcher < Minitest::Test
  def setup
    file = File.open(File.expand_path('../fixtures/test_links.js', __FILE__))
    @links = file.read.split("\n")
    file.close
  end

  def test_aborts_with_error_on_not_finding_search_term
    assert_raises SystemExit do
      ExactSearcher.search(@links, "goooo")
    end
  end

  def test_launches_correct_url_on_finding_search_term
  	Launchy.expects(:open).with("https://developer.android.com/reference/android/animation/Animator.html").once()
    ExactSearcher.search(@links, "Animator")
  end
end
