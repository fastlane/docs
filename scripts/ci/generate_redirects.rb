require_relative "available_redirects"
require 'fileutils'

puts("Generating redirects for the following URLs:")
puts(docs_redirects)

docs_redirects.each do |from, to|
  FileUtils.mkdir_p(from)

  full_path = File.join(from, "index.html")
  to = "/#{to}" unless to.start_with?("/")
  content = "<script type='text/javascript'>window.location.href = '#{to}' + window.location.hash;</script>"

  File.write(full_path, content)
  puts("Successfully created file at path '#{full_path}' to point to '#{to}'")
end
