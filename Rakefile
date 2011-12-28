require 'bundler/gem_tasks'
require 'rake'
require 'rake/task'
require 'rake/testtask'

=begin
task :test do
  exec 'rbenv local 1.9.2-p290 && bundle exec rspec spec/nutshell-crm_spec.rb && rbenv local 1.9.3'
end
=end

=begin
task :foo do
  exec 'bundle exec rspec spec/nutshell-crm_spec.rb -e "should update a process step"'
end
=end

task :doc do
  exec 'yardoc && cp -vR doc/ ../nutshell-crm-docs && cd ../nutshell-crm-docs && git add . && git commit -am "Update documentation." && git push origin gh-pages'
end

task :default => :rspec