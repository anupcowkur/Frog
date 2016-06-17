class LinksGetter
  def get_links_from_file
    contents = File.read(File.expand_path("../assets/lists.js", File.dirname(__FILE__)))

    return contents.partition("[").last.partition("]").first.split("\n")
  end
end
