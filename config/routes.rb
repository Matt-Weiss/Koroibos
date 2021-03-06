Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :olympians, only: [:index]
      resources :olympian_stats, only: [:index]
      resources :events, only: [:index, :show] do
        resources :medalists, only: [:index]
      end
      resources :team_medals, only: [:index]
      resources :events_participants, only: [:index]
    end
  end
end
