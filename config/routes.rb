Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    post 'analyzes/analyze'
    post 'analyzes/correlate'
  end
end
