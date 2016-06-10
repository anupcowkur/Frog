require_relative 'search_router'
require_relative 'exact_searcher'
require_relative 'fuzzy_searcher'
require_relative 'browser_launcher'
require_relative 'exiter'
require_relative 'options_helper'
require_relative 'search_term_helper'
require_relative 'links_helper'

class Starter
  def initialize(exiter,
                 options_helper,
                 search_term_helper,
                 links_helper,
                 exact_searcher,
                 fuzzy_searcher,
                 search_router,
                 browser_launcher)
    @exiter = exiter
    @options_helper = options_helper
    @search_term_helper = search_term_helper
    @links_helper = links_helper
    @exact_searcher = exact_searcher
    @fuzzy_searcher = fuzzy_searcher
    @search_router = search_router
    @browser_launcher = browser_launcher
  end

  def start
    options = @options_helper.get_options

    search_term = @search_term_helper.get_search_term

    links = @links_helper.get_links_from_file

    target_link = @search_router.delegate_to_appropriate_searcher(options[:exact], search_term, links)

    @browser_launcher.launch(target_link)
  end
end
