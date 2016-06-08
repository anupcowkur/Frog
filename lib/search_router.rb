class SearchRouter

  def initialize (exact_searcher, fuzzy_searcher)
    @exact_searcher = exact_searcher
    @fuzzy_searcher = fuzzy_searcher
  end

  def delegate_to_appropriate_searcher(exact, search_term, links)
    if exact
      # If it's an exact search
      @exact_searcher.search(search_term, links)
    else
      # If it's a fuzzy search
      @fuzzy_searcher.search(search_term, links)
    end
  end
end
