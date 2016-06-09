require 'optparse'

class IOHandler

  def initialize(exiter)
    @exiter = exiter
  end

  def get_search_term
    search_term = ARGV[0]

    if search_term.nil?
      @exiter.exit_due_to_no_search_term
      return
    end

    return search_term
  end

  def get_links_from_file
    file = File.open(File.expand_path("../assets/lists.js", File.dirname(__FILE__)), "r")
    contents = file.read
    file.close

    return contents.partition("[").last.partition("]").first.split("\n")
  end
end
