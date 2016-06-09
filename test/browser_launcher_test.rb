require 'test_helper'
require 'browser_launcher'

class BrowserLauncherTest < Minitest::Test
  def test_opens_browser
    mock = MiniTest::Mock.new
    mock.expect(:call, nil, ["link"])
    Launchy.stub(:open, mock) do
      BrowserLauncher.new.launch("link")
    end
    mock.verify
  end
end
