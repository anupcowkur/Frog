require_relative 'io_handler'
require_relative 'search_router'
require_relative 'exact_searcher'
require_relative 'fuzzy_searcher'
require_relative 'browser_launcher'
require_relative 'exiter'
require_relative 'options_helper'

module DroidDocs

  class Program

  	def initialize
  		@exiter = Exiter.new
      @options_helper = OptionsHelper.new(@exiter)
  		@io_handler = IOHandler.new(@exiter)
  		@exact_searcher = ExactSearcher.new(@exiter)
  		@fuzzy_searcher = FuzzySearcher.new(@exiter)
  		@search_router = SearchRouter.new(@exact_searcher, @fuzzy_searcher)
  		@browser_launcher = BrowserLauncher.new
  	end

    def start
      options = @options_helper.get_options

      search_term = @io_handler.get_search_term

      links = @io_handler.get_links_from_file

      target_link = @search_router.delegate_to_appropriate_searcher(options[:exact], search_term, links)

      @browser_launcher.launch(target_link)
    end
  end
end

DroidDocs::Program.new.start