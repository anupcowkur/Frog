require 'starter'

module DroidDocs

  def self.start
    # Initialize dependencies and start the program
    exiter = Exiter.new
    exact_searcher = ExactSearcher.new
    fuzzy_searcher = FuzzySearcher.new(exiter)

    Starter.new(exiter,
                OptionsGetter.new(exiter),
                SearchTermGetter.new(exiter),
                LinksGetter.new,
                exact_searcher,
                fuzzy_searcher,
                SearchRouter.new(exact_searcher, fuzzy_searcher),
                BrowserLauncher.new).start
  end
end
