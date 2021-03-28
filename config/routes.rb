Rails.application.routes.draw do
  resources :insights, only: %i(index new create)
  root to: redirect { Rails.application.routes.url_helpers.new_insight_path }
end
