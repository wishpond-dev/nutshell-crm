require 'bundler/gem_tasks'
require 'rake/task'

task :test do
  exec 'bundle exec rspec spec/nutshell-crm_spec.rb'
end

task :doc do
  exec 'yardoc && cp -vR doc/ ../nutshell-crm-docs'
end