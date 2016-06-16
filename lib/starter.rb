require_relative 'search_router'
require_relative 'exact_searcher'
require_relative 'fuzzy_searcher'
require 'browser_launcher'
require 'exiter'
require 'options_getter'
require 'search_term_helper'
require 'links_getter'

class Starter
  def initialize(exiter,
                 options_getter,
                 search_term_helper,
                 links_getter,
                 exact_searcher,
                 fuzzy_searcher,
                 search_router,
                 browser_launcher)
    @exiter = exiter
    @options_getter = options_getter
    @search_term_helper = search_term_helper
    @links_getter = links_getter
    @exact_searcher = exact_searcher
    @fuzzy_searcher = fuzzy_searcher
    @search_router = search_router
    @browser_launcher = browser_launcher
  end

  def start
    options = @options_getter.get_options

    search_term = @search_term_helper.get_search_term

    links = @links_getter.get_links_from_file

    target_link = @search_router.delegate_to_appropriate_searcher(options[:exact], search_term, links)

    @browser_launcher.launch(target_link)
  end
end
