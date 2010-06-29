desc "deploy site to neeraj.name"
task :deploy do
  require 'rubygems'
  require 'highline/import'
  require 'net/ssh'

  branch = "master"

    commands = <<EOF
cd ~/apps/blog/cached-copy
git checkout #{branch}
git pull origin #{branch}
git checkout -f
rm -rf _site
jekyll --no-auto
mv _site ../_#{branch}
mv ../#{branch} _old
mv ../_#{branch} ../#{branch}
rm -rf _old
EOF
  commands = commands.gsub(/\n/, "; ")
  system("ssh www.eventsinindia.com -p 30000 '#{commands}'")
end
