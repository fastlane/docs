require "yaml"

# Make sure no page got removed
if git.diff_for_file("mkdocs.yml")
  warn("mkdocs.yml was modified - make sure no modification was made by mistake")

  patch = git.diff_for_file("mkdocs.yml").patch

  # we only care about the pages, not the other config
  # this is probably the most reliable way to detect if it's a page (ends with .md)
  lines = patch.split("\n").delete_if { |a| !a.strip.end_with?(".md") }

  lines.each do |current_line|
    if current_line.start_with?("-")
      page_name = current_line.match(/\-.*\- (.*)/)[1]
      warn("It seems like the page '#{page_name}' got removed from mkdocs.yml, we don't want to remove any public links. Instead please add a redirect to the new page")
    end
  end
end
