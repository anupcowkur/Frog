require "droid_docs/version"
require_relative 'io_handler.rb'
require_relative 'search_router.rb'
require_relative 'exact_searcher.rb'
require_relative 'fuzzy_searcher.rb'

module DroidDocs
  options = IOHandler.get_options()

  search_term = IOHandler.get_search_term()

  links = IOHandler.get_links_from_file()

  SearchRouter.delegate_to_appropriate_searcher(options, search_term, links)
end
