require 'bundler/gem_tasks'
require 'rake/task'

task :test do
  exec 'bundle exec rspec spec/nutshell-crm_spec.rb'
end

task :doc do
  exec 'yardoc && cp -vR doc/ ../nutshell-crm-docs && cd ../nutshell-crm-docs && git add . && git commit -am "Update documentation." && git push origin gh-pages'
end