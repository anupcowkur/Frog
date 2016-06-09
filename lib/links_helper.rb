class LinksHelper
  def get_links_from_file
    file = File.open(File.expand_path("../assets/lists.js", File.dirname(__FILE__)), "r")
    contents = file.read
    file.close

    return contents.partition("[").last.partition("]").first.split("\n")
  end
end
