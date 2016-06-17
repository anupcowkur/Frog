require 'starter'

module DroidDocs

  def self.start
    # Initialize dependencies and start the program
    Starter.new(Exiter.new,
                OptionsGetter.new,
                SearchTermGetter.new,
                LinksGetter.new,
                ExactSearcher.new,
                FuzzySearcher.new,
                SearchRouter.new,
                BrowserLauncher.new).start
  end
end
