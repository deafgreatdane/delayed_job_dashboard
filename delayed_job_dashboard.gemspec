$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "delayed_job_dashboard/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "delayed_job_dashboard"
  s.version     = DelayedJobDashboard::VERSION
  s.authors     = ["Ben Johnson"]
  s.email       = ["deafgreatdane@gmail.com"]
  s.summary     = "A dashboard for delayed_job."
  s.description = "manipulate and view delayed_job information in your app."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.1.0"
  s.add_dependency "haml"

  s.add_development_dependency "sqlite3"
end
