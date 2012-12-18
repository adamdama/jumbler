# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'jumbler/version'
require 'rbconfig'

Gem::Specification.new do |gemspec|
  gemspec.name        = "jumbler"
  gemspec.version     = Jumbler::VERSION
  gemspec.date        = Date.today
  gemspec.summary     = "Jumbler JS Combiner"
  gemspec.description = "Uses Googles Closure Compiler to combine JS files into a single, better formed javascript"
  gemspec.authors     = ["Adam Cox"]
  gemspec.email       = "adamdama@hotmail.com"
  gemspec.homepage    = "https://github.com/adamdama/jumbler"

  gemspec.files         = `git ls-files`.split($/)
  gemspec.executables   = gemspec.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gemspec.test_files    = gemspec.files.grep(%r{^(test|spec|features)/})
  gemspec.require_paths = ["lib"]
  
  gemspec.add_dependency "listen", "~> 0.6.0"
  gemspec.add_dependency "rake"
  
  # OS specific listen dependencies
  gemspec.add_dependency 'rb-kqueue', '~> 0.2' if RbConfig::CONFIG['target_os'] =~ /freebsd/i
  gemspec.add_dependency 'rb-fsevent', '~> 0.9.1' if RbConfig::CONFIG['target_os'] =~ /darwin(1.+)?$/i
  gemspec.add_dependency 'rb-inotify', '~> 0.8.8', :github => 'mbj/rb-inotify' if RbConfig::CONFIG['target_os'] =~ /linux/i
  gemspec.add_dependency 'wdm',        '~> 0.0.3' if RbConfig::CONFIG['target_os'] =~ /mswin|mingw/i
  
  gemspec.add_development_dependency "rspec"
  gemspec.add_development_dependency "bundler"
end