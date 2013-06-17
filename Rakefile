require 'rake'
require 'rake/testtask'
require 'rake/packagetask'
require 'rubygems/package_task'

desc "Default Task"
task :default => [ :test ]

# Run the unit tests
Rake::TestTask.new { |t|
  t.libs << "test"
  t.pattern = 'test/**/*_test.rb'
  t.warning = true
}
