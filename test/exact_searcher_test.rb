require 'test_helper'
require 'exact_searcher'
require 'exiter'

class TestExactSearcher < Minitest::Test
  def setup
    file = File.open(File.expand_path('../test/fixtures/test_links_subset.js', File.dirname(__FILE__)), "r")
    @links = file.read.split("\n")
    file.close
  end

  def test_that_it_errors_out_on_not_finding_search_term 
    mock_exiter = Minitest::Mock::new
    mock_exiter.expect :exit_due_to_doc_not_found, 0
    ExactSearcher.new(mock_exiter).search("goooo", @links)
    mock_exiter.verify    
  end

  def test_that_it_returns_correct_url_on_finding_search_term
    assert_equal "https://developer.android.com/reference/android/accounts/Account.html", ExactSearcher.new(Exiter.new).search("Account", @links)
  end
end
