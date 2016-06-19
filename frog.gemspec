# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'constants'

Gem::Specification.new do |spec|
  spec.name          = "frog"
  spec.version       = ::Constants::VERSION
  spec.authors       = ["Anup Cowkur"]
  spec.email         = ["anupcowkur89@gmail.com"]

  spec.summary       = %q{Frog helps you jump to the right Android dev docs from the command line}
  spec.homepage      = "https://github.com/anupcowkur/frog."
  spec.license       = "MIT"

  all_files          = `git ls-files -z`.split("\x0")
  spec.files         = all_files.grep(%r{^(bin|lib|assets)/})
  spec.executables   << 'frog'
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "minitest-reporters", '~> 1.1', '>= 1.1.9'
  spec.add_development_dependency "byebug", '~> 9.0', '>= 9.0.5'
  spec.add_development_dependency 'mocha', '~> 1.1', '>= 1.1.0'
  
  spec.add_dependency "launchy", '~> 2.4', '>= 2.4.3'
  spec.add_dependency "colorize", '~> 0.7', '>= 0.7.7'
end
