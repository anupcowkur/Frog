# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'constants'

Gem::Specification.new do |spec|
  spec.name          = "droid_docs"
  spec.version       = ::Constants::VERSION
  spec.authors       = ["Anup Cowkur"]
  spec.email         = ["anupcowkur89@gmail.com"]

  spec.summary       = %q{Search Android developer docs through the command line!}
  spec.homepage      = "https://github.com/anupcowkur/droid_docs."
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  all_files          = `git ls-files -z`.split("\x0")
  spec.files         = all_files.grep(%r{^(bin|lib)/})
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "minitest-reporters", "~> 1.1.9"
  spec.add_development_dependency "byebug", "~> 9.0.5"
  
  spec.add_dependency "launchy", "~> 2.4.3"
end
