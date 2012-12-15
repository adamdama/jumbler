#!/usr/bin/env ruby
# Application to watch folders containg javascript
# and passing them to Googles closure compiler upon modification
# resulting in a minified file in a specified directory
#
# Inspired by Compass and Google's Closure Compiler
#
# Uses Listen library
#

require 'listen'

class Jumbler
  
  def initialize args
    @args = args
    @current_dir = Dir.pwd

    @listener = Listen.to(@current_dir, :relative_paths => true, :filter => /\.js$|\.rb$/, :ignore => %r{ignored/path/}) do |modified, added, removed|
      puts modified.inspect
      puts added.inspect
      puts removed.inspect
    end
  end
end


j = Jumbler.new ARGV
=begin
def help
  print "
  Usage: #{__FILE__} watch --in_folder --out_folder
  "
end

if ARGV.empty?
  help
  exit
else
  j = Jumbler.new ARGV
end
=end