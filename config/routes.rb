Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/collect', to: 'redirect#collect'
  get '/r/collect', to: 'redirect#collect'
  get '/analytics', to: 'redirect#google_analytics'
end
