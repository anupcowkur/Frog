require 'test_helper'

class BrowserLauncherTest < Minitest::Test
  def test_opens_browser
  	Launchy.expects(:open).with("link")
  	BrowserLauncher.new.launch("link")
  end
end
