require 'optparse'

class IOHandler
  def self.get_options
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

  def self.get_search_term
    search_term = ARGV[0]

    abort "You need to provide a class to search for" if search_term.nil?

    return search_term
  end

  #response = HTTParty.get "#{BASE_URL}/reference/lists.js"

  def self.get_links_from_file
    file = File.open(File.expand_path("../assets/lists.js", File.dirname(__FILE__)), "r")
    contents = file.read
    file.close

    return contents.partition("[").last.partition("]").first.split("\n")
  end
end
