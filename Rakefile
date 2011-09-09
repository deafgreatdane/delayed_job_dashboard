#!/usr/bin/env rake
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end
begin
  require 'rdoc/task'
rescue LoadError
  require 'rdoc/rdoc'
  require 'rake/rdoctask'
  RDoc::Task = Rake::RDocTask
end

begin
  require "jeweler"
  Jeweler::Tasks.new do |gem|
    gem.name = "delayed_job_dashboard"
    gem.summary = "Dashboard engine for delayed_job"
    gem.files = Dir["{lib}/**/*", "{app}/**/*", "{config}/**/*"]
    gem.authors = ["Ben Johnson"]
    gem.email = "deafgreatdane@gmail.com"
    #gem.d
    # other fields that would normally go in your gemspec
    # like authors, email and has_rdoc can also be included here

  end
rescue
  puts "Jeweler or one of its dependencies is not installed."
end

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'DelayedJobDashboard'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end



Bundler::GemHelper.install_tasks

require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end


task :default => :test
