class BrowserLauncher
  def launch(target_link)
    puts "Boom! Launching #{target_link}"
    Launchy.open(target_link)
  end
end
