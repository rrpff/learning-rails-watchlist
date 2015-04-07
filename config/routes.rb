Rails.application.routes.draw do

    root 'home#index'

    # OAuth paths
    get '/auth/:provider/callback', to: 'sessions#create'
    get '/logout', to: 'sessions#destroy'

    resources :users,
        only: [:index, :show]

    resources :lists do
        resources :films do
            member do
                get 'watch'
                get 'unwatch'
            end
        end
    end

    # Film routes mostly proxy to TMDB API
    # get '/films/:id', to: 'films#show'
    # get '/films/search/:query', to: 'films#search'

end
