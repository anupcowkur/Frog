require 'test_helper'
require 'exact_searcher.rb'
require 'error_handler.rb'

class TestExactSearcher < Minitest::Test
  def setup
    file = File.open(File.expand_path('../test/fixtures/test_links.js', File.dirname(__FILE__)), "r")
    @links = file.read.split("\n")
    file.close
  end

  def test_that_it_errors_out_on_not_finding_search_term 
    mock_error_handler = Minitest::Mock::new
    mock_error_handler.expect :handle_doc_not_found, 0
    ExactSearcher.new(mock_error_handler).search(@links, "goooo")
    mock_error_handler.verify    
  end

  def test_that_it_returns_correct_url_on_finding_search_term
    assert_match "https://developer.android.com/reference/android/accounts/Account.html", ExactSearcher.new(ErrorHandler.new).search(@links, "Account")
  end
end
