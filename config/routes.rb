Rails.application.routes.draw do
  resources :insights, only: %i(index new create)
  root to: redirect { Rails.application.routes.url_helpers.insights_path }
end
