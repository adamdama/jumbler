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
require 'find'

class Jumbler
  @ds = File::SEPARATOR
  
  # initialize jumbler
  def initialize args
    # @args = args
    @current_dir = Dir.pwd
    @watch_dir = @current_dir
    # get all js files to be comiled
    @js_file_paths = self.get_js @watch_dir

    # listen to the specified folder for changes to js files
    @listener = Listen.to(@watch_dir, :relative_paths => true, :filter => /\.js$/, :ignore => %r{ignored/path/}) do |modified, added, removed|
      if(added.length > 0)
        # if a new file is added we need to add it to the array
        added.collect{|item|
          @js_file_paths << @watch_dir + File::SEPARATOR + item
        }
      end
      
      if(removed.length > 0)
        # if a file is removed we need to remove it from the array
        removed.collect{|item|
          @js_file_paths.any? {|path|
            if(path == @watch_dir + File::SEPARATOR + item)
              @js_file_paths.delete(path)
            end
           } 
        }
      end
      
      # compile the new js file
      self.jumble
    end
  end

  # recursively finds all js files from a specified directory
  def get_js root_dir
    file_paths = []

    Find.find(root_dir) do |path|
      file_paths << path if path =~ /.*\.js$/
    end

    return file_paths
  end

  # creates the command to be used to run the closure compiler
  def jumble
    puts @js_file_paths
  end
end

# create the jumbler
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