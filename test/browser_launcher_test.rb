require 'test_helper'

class BrowserLauncherTest < Minitest::Test
  def test_opens_browser
    TestHelper.fake_io("") do
      Launchy.expects(:open).with("link")
      BrowserLauncher.new.launch("link")
      assert_equal "Boom! Launching link", $stdout.string.chomp
    end
  end
end
