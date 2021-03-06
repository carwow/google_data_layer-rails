# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'google_data_layer/rails/version'

Gem::Specification.new do |spec|
  spec.name          = "google_data_layer-rails"
  spec.version       = GoogleDataLayer::Rails::VERSION
  spec.authors       = ["Federico Rebora", "David Santoro"]
  spec.email         = ["developers@carwow.co.uk"]
  spec.description   = %q{Rails helpers to add google data layer javascript to your pages}
  spec.summary       = %q{Rails helpers to add google data layer javascript to your pages}
  spec.homepage      = "https://github.com/carwow/google_data_layer-rails"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "railties"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
