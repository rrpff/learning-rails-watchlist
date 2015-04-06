Rails.application.routes.draw do

    root 'home#index'

    # OAuth paths
    get '/auth/:provider/callback', to: 'sessions#create'
    get '/logout', to: 'sessions#destroy'

end
