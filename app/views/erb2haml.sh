#! /bin/sh

find . -name '*.html.erb' | xargs ruby -e 'ARGV.each { |i| puts "html2haml -r #{i} #{i.sub(/erb$/,"haml")}"}' | bash
find . -name "*.html.erb" -exec rm -rf {} \;
