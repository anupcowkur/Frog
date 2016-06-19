class LinksUpdater
  attr_reader :timestamp_file_path, :links_file_path

  def initialize
    @timestamp_file_path = File.expand_path("../assets/last_updated.txt", File.dirname(__FILE__))
    @links_file_path = File.expand_path("../assets/lists.js", File.dirname(__FILE__))
  end

  def update_links_if_needed
    if is_time_to_update?
      update_links_from_website
      update_timestamp
    end
  end

  private
  def is_time_to_update?
    timestamp = File.read(@timestamp_file_path)

    last_updated = DateTime.parse(timestamp)

    one_month_from_last_updated =  last_updated + 30

    return DateTime.now  > one_month_from_last_updated
  end

  private
  def update_links_from_website
    begin
      # Get the latest links from the website
      puts "Updating docs to the latest and greatest...".green
      response = Net::HTTP.get_response(URI.parse(Constants::LINKS_URL))
    rescue StandardError
      # Exit if links update fails
      puts "Looks like there's an internet connection problem. Will try to update later.".red
      Exiter.new.exit_due_to_net_http_fail_during_links_update
      return
    end

    # Write them to file
    File.write(@links_file_path, response.body)
  end

  private
  def update_timestamp
    File.write(@timestamp_file_path, "#{DateTime.now}")
    puts "Docs updated".green
  end
end
