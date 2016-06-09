require_relative 'constants'

class ExactSearcher

  def initialize(exiter)
    @exiter = exiter
  end

  def search (search_term, links)
    # Grep the links array to exactly match our search term
    filtered_links = links.grep(/\/#{search_term}.html\"/i)
    
    # Handle error and return if we don't find anything
    if filtered_links.empty?
      @exiter.exit_due_to_doc_not_found
      return
    end

    # Get the relative URL of the required class
    relative_url = filtered_links[0].partition("link:\"").last.partition("\"").first

    # Append to base URL to form complete URL
    target_link = "#{Constants::BASE_URL}/#{relative_url}"

    return target_link
  end
end
