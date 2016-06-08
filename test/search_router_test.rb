require 'test_helper'
require 'search_router.rb'
require 'exact_searcher.rb'
require 'fuzzy_searcher.rb'

class TestSearchRouter < Minitest::Test

  def test_that_it_routes_to_exact_searcher_on_exact_search
    exact_searcher = Minitest::Mock::new
    fuzzy_searcher = Minitest::Mock::new
    exact_searcher.expect :search, nil, ["goooo", ["link1", "link2"]]
    SearchRouter.new(exact_searcher,fuzzy_searcher).delegate_to_appropriate_searcher(exact = true, "goooo", ["link1", "link2"])
    exact_searcher.verify    
  end

  def test_that_it_routes_to_fuzzy_searcher_on_fuzzy_search
    exact_searcher = Minitest::Mock::new
    fuzzy_searcher = Minitest::Mock::new
    fuzzy_searcher.expect :search, nil, ["goooo", ["link1", "link2"]]
    SearchRouter.new(exact_searcher,fuzzy_searcher).delegate_to_appropriate_searcher(exact = false, "goooo", ["link1", "link2"])
    fuzzy_searcher.verify    
  end
end
