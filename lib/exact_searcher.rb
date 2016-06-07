require 'launchy'
require_relative 'constants.rb'

class ExactSearcher
  def self.search (links, search_term)

  	# Grep the links array to exactly match our search term
    filtered_links = links.grep(/\.#{search_term}.html\"/io)

    # Abort if we don't find anything
    abort "Sorry. It looks like we couldn't what you were looking for" if filtered_links.empty?

    # Get the relative URL of the required class
    relative_url = filtered_links[0].partition("link:\"").last.partition("\"").first

    # Append to base URL to form complete URL
    target_link = "#{Constants::BASE_URL}/#{relative_url}"

    # Launch browser
    Launchy.open(target_link)

    # End program
    exit(0)
  end
end
