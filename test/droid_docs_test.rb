require 'constants'
require 'search_router'
require 'exact_searcher'
require 'fuzzy_searcher'
require 'browser_launcher'
require 'exiter'
require 'options_getter'
require 'search_term_getter'
require 'links_getter'
require 'droid_docs'

class DroidDocsTest < Minitest::Test

  def test_that_it_has_a_version_number
    refute_nil Constants::VERSION
  end

  def test_that_it_has_the_correct_base_url
    assert_equal Constants::BASE_URL, "https://developer.android.com"
  end

  def test_that_it_has_the_correct_links_url
    assert_equal Constants::LINKS_URL, "https://developer.android.com/reference/lists.js"
  end

  def test_that_it_starts_and_executes_operations
    # Get mock links
    mock_links = File.read(File.expand_path('../test/fixtures/test_links_subset.js', File.dirname(__FILE__))).split("\n")

    # Create mock search term and target link for verification
    mock_search_term = "Animator"
    mock_target_link = "https://developer.android.com/reference/android/animation/Animator.html"

    # Set mock expectations
    OptionsGetter.any_instance.expects(:get_options).returns({exact: true})
    SearchTermGetter.any_instance.expects(:get_search_term).returns(mock_search_term)
    LinksGetter.any_instance.expects(:get_links_from_file).returns(mock_links)
    SearchRouter.any_instance.expects(:delegate_to_appropriate_searcher).with(true, mock_search_term, mock_links).returns(mock_target_link)
    BrowserLauncher.any_instance.expects(:launch).with(mock_target_link)

    # Run the subject test
    DroidDocs.start
  end
end
