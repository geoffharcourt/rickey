# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rickey/version'

Gem::Specification.new do |spec|
  spec.name          = "rickey"
  spec.version       = Rickey::VERSION
  spec.authors       = ["Geoff Harcourt"]
  spec.email         = ["geoff.harcourt@gmail.com"]

  spec.summary       = %q{Rickey queries MLBAM for team transaction information.}
  spec.description   = %q{Rickey uses the same API that powers MLB's team pages to (politely) request information about transactions, filtered by team or league affiliation for a given date.}
  spec.homepage      = "https://github.com/geoffharcourt/rickey"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "excon"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
