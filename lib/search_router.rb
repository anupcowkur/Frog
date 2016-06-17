class SearchRouter
  def delegate_to_appropriate_searcher(exact, search_term, links)
    if exact
      # If it's an exact search
      ExactSearcher.new.search(search_term, links)
    else
      # If it's a fuzzy search
      FuzzySearcher.new.search(search_term, links)
    end
  end
end
