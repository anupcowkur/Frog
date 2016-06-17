require 'starter'

module DroidDocs

  def self.start
    # Initialize dependencies and start the program
    exiter = Exiter.new

    Starter.new(exiter,
                OptionsGetter.new,
                SearchTermGetter.new(exiter),
                LinksGetter.new,
                ExactSearcher.new,
                FuzzySearcher.new,
                SearchRouter.new,
                BrowserLauncher.new).start
  end
end
