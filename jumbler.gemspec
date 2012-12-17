# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jumbler/version'

Gem::Specification.new do |gemspec|
  gemspec.name        = "jumbler"
  gemspec.version     = Jumbler::VERSION
  gemspec.date        = Date.today
  gemspec.summary     = "Jumbler JS Combiner"
  gemspec.description = "Uses Googles Closure Compiler to combine JS files into a single, better formed javascript"
  gemspec.authors     = ["Adam Cox"]
  gemspec.email       = "adamdama@hotmail.com"

  gemspec.files         = `git ls-files`.split($/)
  gemspec.executables   = gemspec.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gemspec.test_files    = gemspec.files.grep(%r{^(test|spec|features)/})
  gemspec.require_paths = ["lib"]
  
  gemspec.add_dependency "version", "~> 0.6.0"
  
  gemspec.add_development_dependency "bundler"
end