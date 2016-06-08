require 'optparse'

class IOHandler

  def initialize(error_handler)
    @error_handler = error_handler
  end

  def get_options
    options = {exact: false}
    OptionParser.new do |opts|
      opts.banner = "Usage: droiddocs.rb [options] search_term"

      opts.on("-e", "--exact", "Search for the exact class") do |v|
        options[:exact] = true
      end

      opts.on('-h', '--help', 'Displays Help') do
        puts opts
        exit
      end
    end.parse!

    return options
  end

  def get_search_term
    search_term = ARGV[0]

    if search_term.nil?
      @error_handler.handle_no_search_term
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
