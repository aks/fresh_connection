# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fresh_connection/version'

Gem::Specification.new do |spec|
  spec.name          = "fresh_connection"
  spec.version       = FreshConnection::VERSION
  spec.authors       = ["Tsukasa OISHI"]
  spec.email         = ["tsukasa.oishi@gmail.com"]

  spec.summary       = %q{FreshConnection supports to connect with Mysql slave servers via Load Balancers.}
  spec.description   = %q{https://github.com/tsukasaoishi/fresh_connection}
  spec.homepage      = "https://github.com/tsukasaoishi/fresh_connection"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 2.0'
  spec.add_dependency 'activerecord', '>= 3.2.0', '< 4.3'
  spec.add_dependency 'activesupport', '>= 3.2.0', '< 4.3'
  spec.add_dependency 'mysql2', '~> 0.3'

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", '~> 10.0'
  spec.add_development_dependency "rspec", '~> 3.0'
  spec.add_development_dependency 'appraisal', '~> 2.0'
end
