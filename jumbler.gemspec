#
# Gemspec for jumbler
#

Gem::Specification.new do |gemspec|
  gemspec.name        = 'jumbler'
  gemspec.version     = '0.0.1'
  gemspec.date        = Date.today
  gemspec.summary     = "Jumbler JS Combiner"
  gemspec.description = "Uses Googles Closure Compiler to combine JS files into a single, better formed javascript"
  gemspec.authors     = ["Adam Cox"]
  gemspec.email       = 'adamdama@hotmail.com'
  gemspec.files       = ["lib/jumbler.rb"]
  gemspec.homepage    = 'https://github.com/adamdama/jumbler'
  gemspec.add_dependency 'listen', '~> 0.6.0'
  gemspec.add_dependency 'wdm','~> 0.0.3'
  gemspec.executables << 'jumbler'
  
  gemspec.files = %w(README.md)
  gemspec.files += Dir.glob("bin/*")
  gemspec.files += Dir.glob("lib/gcc/*")
end