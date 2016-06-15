require 'time'
require 'net/http'
require 'constants'

class LinksUpdater

  def update_links_if_needed
    if is_time_to_update?
      update_links_from_website
      update_timestamp
    end
  end

  def is_time_to_update?
    timestamp = File.open(File.expand_path("../assets/last_updated.txt", File.dirname(__FILE__)), &:gets)

    last_updated = DateTime.parse(timestamp)

    one_month_from_last_updated =  last_updated + 30

    return DateTime.now  > one_month_from_last_updated
  end

  def update_links_from_website
    # Get the latest links from the website
    response = Net::HTTP.get_response(URI.parse(Constants::LINKS_URL))

    # Write them to file
    file_path = File.expand_path("../assets/lists.js", File.dirname(__FILE__))
    File.open(file_path,'w') do |f|
      f.write response.body
    end
  end

  def update_timestamp
    File.write(File.expand_path("../assets/last_updated.txt", File.dirname(__FILE__)), "#{DateTime.now}")
  end
end
