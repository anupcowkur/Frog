require 'test_helper'
require 'links_getter'

class TestLinksHelper < Minitest::Test

  def test_that_it_gets_links_from_file
    expected_links = File.read(File.expand_path('../test/fixtures/test_links_array.js', File.dirname(__FILE__)))
   
    result_links = LinksGetter.new.get_links_from_file.to_s

    assert_equal expected_links, result_links
  end
end
