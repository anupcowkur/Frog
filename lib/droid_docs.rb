require_relative 'io_handler.rb'
require_relative 'search_router.rb'
require_relative 'exact_searcher.rb'
require_relative 'fuzzy_searcher.rb'
require_relative 'browser_launcher.rb'
module DroidDocs

  class Program

    def start(io_handler, search_router, browser_launcher)

      options = io_handler.get_options()

      search_term = io_handler.get_search_term()

      links = io_handler.get_links_from_file()

      target_link = search_router.delegate_to_appropriate_searcher(options, search_term, links)

      browser_launcher.launch(target_link)
    end
  end
end

DroidDocs::Program.new.start(IOHandler.new, SearchRouter.new(ExactSearcher.new, FuzzySearcher.new), BrowserLauncher.new)
