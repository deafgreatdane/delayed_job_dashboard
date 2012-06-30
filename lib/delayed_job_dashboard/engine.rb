module DelayedJobDashboard
  require 'delayed_job_dashboard'
  require 'rails'
  require 'haml'
  class Engine < Rails::Engine
    engine_name :delayed_job_dashboard
    paths["app"]

    initializer :assets do |config|
      Rails.application.config.assets.precompile += %w( delayed_job_dashboard.css delayed_job_dashboard.js)
    end
  end
end
