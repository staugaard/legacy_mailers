# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'legacy_mailers/version'

Gem::Specification.new do |spec|
  spec.name          = "legacy_mailers"
  spec.version       = LegacyMailers::VERSION
  spec.authors       = ["Mick Staugaard"]
  spec.email         = ["mick@staugaard.com"]
  spec.description   = "Brings back the legacy ActionMailer 2.3 API to ActionMailer 3.x"
  spec.summary       = "This is only meant to help you when migration to Rails 3.2"
  spec.homepage      = "https://github.com/staugaard/legacy_mailers"
  spec.license       = "MIT"

  spec.files         = Dir.glob("lib/**/*") + %w(README.md)
  spec.test_files    = Dir.glob("test/**/*")
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "mocha"
  spec.add_development_dependency "debugger"
  spec.add_development_dependency "appraisal", "~> 0.5"

  spec.add_dependency "actionmailer", "~> 3.0"
end
