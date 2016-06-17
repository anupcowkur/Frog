require 'test_helper'
require 'search_router'
require 'exact_searcher'
require 'fuzzy_searcher'

class TestSearchRouter < Minitest::Test

  def test_that_it_routes_to_exact_searcher_on_exact_search
    ExactSearcher.any_instance.expects(:search).with("goooo", ["link1", "link2"])
    SearchRouter.new.delegate_to_appropriate_searcher(exact = true, "goooo", ["link1", "link2"])
  end

  def test_that_it_routes_to_fuzzy_searcher_on_fuzzy_search
    FuzzySearcher.any_instance.expects(:search).with("goooo", ["link1", "link2"])
    SearchRouter.new.delegate_to_appropriate_searcher(exact = false, "goooo", ["link1", "link2"])
  end
end
