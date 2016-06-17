# Get the project root
lib = File.expand_path('../../lib', __FILE__)

# Add project root to LOAD_PATH
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

# Require everything in lib so we don't have to require
# them in each test
Dir.glob(lib + '/*', &method(:require))

# Require minitest and mocha stuff
require "minitest/reporters"
Minitest::Reporters.use!
require 'minitest/autorun'
require 'mocha/mini_test'

# Require byebug for debugging
require 'byebug'

# Add a fake_io method in TestHelper module to
# fake stdin and stdout
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
