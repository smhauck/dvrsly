namespace :changelog do

desc 'Regenerate the changelog.html.erb file based on latest git commits'
task :update do
# Recreate the Changelog page

# changelog_file = Rails.root.to_s + "/app/views/pages/changelog.html.erb"
changelog_file = Rails.root.join('app','views','pages','changelog.html.erb')

f = File.open(changelog_file, "w")
f.write("<h1>Changelog</h1>")
f.write("<pre>")
f.write(`git log --pretty=reference`)
f.write("</pre>")
f.close
end
end
