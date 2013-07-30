require "rubygems"
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/test*.rb']
  t.verbose = true
end

file 'item.tab.rb' => 'item.y.rb' do
  sh 'racc item.y.rb'
end

task :racc_and_test => ['item.tab.rb', 'test']

task :default => :racc_and_test
