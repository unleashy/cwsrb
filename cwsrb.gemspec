# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cwsrb/version'

Gem::Specification.new do |spec|
  spec.name    = 'cwsrb'
  spec.version = Cwsrb::VERSION
  spec.authors = ['Unleashy']
  spec.email   = ['']

  spec.summary     = "Access Conworkshop's API with Ruby."
  spec.description = "A simple wrapper for ConWorkShop's (http://conworkshop.com) API in Ruby."
  spec.homepage    = 'https://github.com/unleashy/cwsrb'
  spec.license     = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'httparty'

  spec.required_ruby_version = '~> 2.1.0'

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake',    '~> 10.0'
  spec.add_development_dependency 'rspec',   '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.39.0', require: false
end
