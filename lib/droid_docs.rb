require_relative 'io_handler.rb'
require_relative 'search_router.rb'
require_relative 'exact_searcher.rb'
require_relative 'fuzzy_searcher.rb'
require_relative 'browser_launcher.rb'
require_relative 'error_handler.rb'
module DroidDocs

  class Program

  	def initialize
  		@error_handler = ErrorHandler.new
  		@io_handler = IOHandler.new(@error_handler)
  		@exact_searcher = ExactSearcher.new(@error_handler)
  		@fuzzy_searcher = FuzzySearcher.new(@error_handler)
  		@search_router = SearchRouter.new(@exact_searcher, @fuzzy_searcher)
  		@browser_launcher = BrowserLauncher.new
  	end

    def start
      options = @io_handler.get_options()

      search_term = @io_handler.get_search_term()

      links = @io_handler.get_links_from_file()

      target_link = @search_router.delegate_to_appropriate_searcher(options[:exact], search_term, links)

      @browser_launcher.launch(target_link)
    end
  end
end

DroidDocs::Program.new.start