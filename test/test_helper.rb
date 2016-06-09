$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'droid_docs/version'

require 'constants'

require "minitest/reporters"
Minitest::Reporters.use!
require 'minitest/autorun'

require 'byebug'

module TestHelper
  def self.fake_io(text)
    begin
      $stdin = StringIO.new
      $stdin.puts(text)
      $stdin.rewind
      $stdout = StringIO.new
      yield
    ensure
      $stdin = STDIN
      $stdout = STDOUT
    end
  end
end
