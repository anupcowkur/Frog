require 'test_helper'

class BrowserLauncherTest < Minitest::Test
  def test_opens_browser
    TestHelper.fake_io("") do
      Launchy.expects(:open).with("link")
      BrowserLauncher.new.launch("link")
      assert_match "\e[0;32;49mBoom! Launching link\e[0m", $stdout.string.chomp
    end
  end
end
