module DroidDocs

  def self.start
    options = OptionsGetter.new.get_options

    search_term = SearchTermGetter.new.get_search_term

    links = LinksGetter.new.get_links_from_file

    target_link = SearchRouter.new.delegate_to_appropriate_searcher(options[:exact], search_term, links)

    BrowserLauncher.new.launch(target_link)
  end
end
