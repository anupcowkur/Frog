require 'constants'
require 'search_router'
require 'exact_searcher'
require 'fuzzy_searcher'
require 'browser_launcher'
require 'exiter'
require 'options_helper'
require 'search_term_helper'
require 'links_getter'
require 'starter'

class StarterTest < Minitest::Test

  def test_that_it_has_a_version_number
    refute_nil Constants::VERSION
  end

  def test_that_it_has_the_correct_base_url
    assert_equal Constants::BASE_URL, "https://developer.android.com"
  end

  # This test doesn't check the order of the calls on the mocks because 
  # minitest does not have any provision to check this.
  def test_that_it_starts_and_executes_operations
    # Get mock links
    file = File.open(File.expand_path('../test/fixtures/test_links_subset.js', File.dirname(__FILE__)), "r")
    mock_links = file.read.split("\n")
    file.close

    # Create mocks dependencies
    mock_exiter = Minitest::Mock::new
    mock_options_helper = Minitest::Mock::new
    mock_search_term_helper = Minitest::Mock::new
    mock_links_getter = Minitest::Mock::new
    mock_exact_searcher = Minitest::Mock::new
    mock_fuzzy_searcher = Minitest::Mock::new
    mock_search_router = Minitest::Mock::new
    mock_browser_launcher = Minitest::Mock::new

    # Create mock search term and target link for verification
    mock_search_term = "Animator"
    mock_target_link = "https://developer.android.com/reference/android/animation/Animator.html"

    # Set mock expectations
    mock_options_helper.expect :get_options, {exact: true}
    mock_search_term_helper.expect :get_search_term, mock_search_term
    mock_links_getter.expect :get_links_from_file, mock_links
    mock_search_router.expect :delegate_to_appropriate_searcher, mock_target_link , [true, mock_search_term, mock_links]
    mock_browser_launcher.expect :launch, nil, [mock_target_link]

    # Run the subject test
    Starter.new(mock_exiter,
                mock_options_helper,
                mock_search_term_helper,
                mock_links_getter,
                mock_exact_searcher,
                mock_fuzzy_searcher,
                mock_search_router,
                mock_browser_launcher).start

    # Verify expectations
    mock_options_helper.verify
    mock_search_term_helper.verify
    mock_links_getter.verify
    mock_search_router.verify
    mock_browser_launcher.verify
  end
end
