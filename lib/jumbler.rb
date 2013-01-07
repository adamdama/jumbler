#!/usr/bin/env ruby
# Application to watch folders containg javascript
# and passing them to Googles closure compiler upon modification
# resulting in a minified file in a specified directory
#
# Inspired by Compass and Google"s Closure Compiler
#
# Uses Listen library
#
# Requires java
# Requires java to be add to PATH
#

# application requirements
require "listen"
require "find"

require "jumbler/version"

class Jumbler
  # initialize jumbler
  def initialize args    
    @gcc_path = File.join(File.dirname(__FILE__),"gcc","compiler.jar")
    @java_exec = args.java_exec

    @current_dir = Dir.pwd
    @watch_dir = args.watch_folder
    @output_file = args.output_file
    
    # get all js files to be comiled
    @js_file_paths = self.get_js @watch_dir
    
    puts "jumbler is now looking for changes"
    # listen to the specified folder for changes to js files
    @listener = Listen.to(@watch_dir, :relative_paths => true, :filter => /\.js$/, :ignore => %r{ignored/path/}) do |modified, added, removed|
      puts "changes detected"
      
      all_changes = modified + added + removed
      
      puts all_changes
      # stop if the change was the compiled file
      unless(all_changes.length == 1 && "#{File.join(@watch_dir, all_changes[0])}" == @output_file)
      
        puts "recompilation needed"
        if(added.length > 0)
          # if a new file is added we need to add it to the array
          added.each{|item|
            @js_file_paths << File.join(@watch_dir, item)
          }
        end
  
        if(removed.length > 0)
          # if a file is removed we need to remove it from the array
          removed.each{|item|
            @js_file_paths.any? {|path|
              if(path == File.join(@watch_dir, item))
                @js_file_paths.delete(path)
              end
             }
          }
        end
  
        # compile the new js file
        self.jumble
      end
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
    command = ""

    @js_file_paths.each {|item|
      command += '--js "' + item + '" '
    }

    command += ' --js_output_file "' + @output_file + '"'
    
    self.exjar command
  end

  # executes the closure compiler
  def exjar args
    # move to the compilers directory
    Dir.chdir("#{File.dirname(@gcc_path)}") do
      # execute the compiler
      retResult  = system("#{@java_exec} -jar #{File.basename(@gcc_path)} #{args}")
      puts retResult
    end #chdir
    
    # move back to original directory
    Dir.chdir(@current_dir)
  end
end