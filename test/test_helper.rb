$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'droid_docs/version.rb'

require 'constants.rb'

require "minitest/reporters"
Minitest::Reporters.use!
require 'minitest/autorun'

require 'byebug'
