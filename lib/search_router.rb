class SearchRouter
  
  def initialize (exact_searcher, fuzzy_searcher)
  	@exact_searcher = exact_searcher
  	@fuzzy_searcher = fuzzy_searcher
  end

  def delegate_to_appropriate_searcher(options, search_term, links)
    # If it's an exact search
    if options[:exact]
      @exact_searcher.search(links, search_term)
    else
      # If it's a fuzzy search
      @fuzzy_searcher.search(links, search_term)
    end
  end
end
