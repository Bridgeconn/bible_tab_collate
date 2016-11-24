#!/usr/bin/env ruby

file_data = []
name_file = "bible_tab_version"

directory_name = "output_folder"
Dir.mkdir(directory_name) unless File.exists?(directory_name)

output_name = "#{directory_name}/#{File.basename(name_file, '.*')}.tab"
output = File.open(output_name, 'w')

Dir.glob("**/*.tab") do |file_name|
  file = file_name
  text = File.open(file, "r:utf-8").read

  text.each_line do |line|
    line.split("\r").each_with_index do |l, i|
        file_data << l
    end
  end
end

file_data.each do |v|
    output << v
end

output.close
