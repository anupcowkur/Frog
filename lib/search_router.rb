class SearchRouter
  def self.delegate_to_appropriate_searcher(options, search_term, links)
    # If it's an exact search
    if options[:exact]
      ExactSearcher.search(links,search_term)
    else
      # If it's a fuzzy search
      FuzzySearcher.search(links, search_term)
    end
  end
end
