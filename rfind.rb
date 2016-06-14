#!/usr/bin/env ruby

# Derek Roberts
# 465 
# 6/2/2016
# This is a utility for making the search through rails files a bit easier
# Give it a string to regex and it will find filenames and contents matching it

allowed_file_extensions = /(\.rb$|\.erb$|\.js$|\.css$|\.html$|\.yml$|\.txt$)/

printf "Files with names that matches <%s>\n", ARGV[0]

files = `find .`

files.split.sort.each do |filename|
	if filename =~ allowed_file_extensions && filename =~ /#{ARGV[0]}/
		printf "  %s\n", filename
	end
end

puts '*' * 50

printf "Files with content that matches <%s>\n", ARGV[0]

first = true

files.split.sort.each do |file|
  next if file == '.'
  if file =~ allowed_file_extensions
    if lines = `grep #{ARGV[0]} -in #{file}`.split("\n")
      if lines.any? 
        if first
          first = false
        else
          puts '-' * 50
        end
        puts file
        lines.each {|line| puts "  #{line}"} 
      end
    end
  end
end
