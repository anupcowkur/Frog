require 'test_helper'

class TestExactSearcher < Minitest::Test
  def setup
    file = File.open(File.expand_path('../test/fixtures/test_links_subset.js', File.dirname(__FILE__)), "r")
    @links = file.read.split("\n")
    file.close
  end

  def test_that_it_errors_out_on_not_finding_search_term 
    Exiter.any_instance.expects(:exit_due_to_doc_not_found)
    ExactSearcher.new.search("goooo", @links)
  end

  def test_that_it_returns_correct_url_on_finding_search_term
    assert_equal "https://developer.android.com/reference/android/accounts/Account.html", ExactSearcher.new.search("Account", @links)
  end
end
