module DelayedJobDashboard
  require 'delayed_job_dashboard'
  require 'rails'
  require 'haml'
 class Engine < Rails::Engine
    engine_name :delayed_job_dashboard
    paths["app"]         # => ["app/helpers"]
    #paths["app/helpers"]         # => ["app/helpers"]
                             #  end
   end
end