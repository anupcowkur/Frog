require 'optparse'

class OptionsGetter
  def initialize(exiter)
    @exiter = exiter
  	@options = {exact: false}
    @options_parser = OptionParser.new do |opts|
      opts.banner = "Usage: droiddocs.rb [options] search_term"
  
      opts.on("-e", "--exact", "Search for the exact class") do |v|
        @options[:exact] = true
      end

      opts.on('-h', '--help', 'Displays Help') do
        puts opts
        @exiter.exit_after_showing_help
      end
    end
  end

  def get_options
  	@options_parser.parse!
  	return @options
  end
end
