DelayedJobDashboard::Engine.routes.draw do
  resources :delayed_jobs do
    collection do
      match "counts"
      match "wip"
      match "future"
      match "overdue"
      match "failing"
    end
  end
  match "counts" =>"delayed_jobs#counts" ,:as =>"counts"
  root :to =>"delayed_jobs#index"

end