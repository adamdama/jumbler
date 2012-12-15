#
# Gemspec for jumbler
#

Gem::Specification.new do |gemspec|
  gemspec.name        = 'jumbler'
  gemspec.version     = '0.0.0'
  gemspec.date = Date.today
  gemspec.summary     = "Jumbler"
  gemspec.description = "Jumbler"
  gemspec.authors     = ["Adam Cox"]
  gemspec.email       = 'adamdama@hotmail.com'
  gemspec.files       = ["lib/jumbler.rb"]
  gemspec.homepage    = 'https://github.com/adamdama/jumbler'
  gemspec.add_dependency 'listen', '~> 0.6.0'
  gemspec.add_dependency 'wdm','~> 0.0.3'
end