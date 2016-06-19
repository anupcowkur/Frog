# Get the project root
lib = File.expand_path('../../lib', __FILE__)

# Add project root to LOAD_PATH
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

# Require everything in lib so we don't have to require
# them in each file
Dir.glob(lib + '/*', &method(:require))

# Require external and third party libs
require 'optparse'
require 'launchy'
require 'time'
require 'net/http'
require 'colorize'

module DroidDocs
  def self.start
    options = OptionsGetter.new.get_options

    search_term = SearchTermGetter.new.get_search_term

    links = LinksGetter.new.get_links_from_file

    target_link = SearchRouter.new.delegate_to_appropriate_searcher(options[:exact], search_term, links)

    BrowserLauncher.new.launch(target_link)

    LinksUpdater.new.update_links_if_needed
  end
end
