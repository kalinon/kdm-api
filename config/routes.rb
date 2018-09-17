Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    # Use for login and authorize all resource
    use_doorkeeper do
      # No need to register client application
      skip_controllers :applications, :authorized_applications
    end

    scope :v1, defaults: { format: :json } do
      resources :gear_types
      resources :resource_types
      resources :locations
      resources :survival_actions
      resources :weapon_proficiencies
      resources :cause_of_deaths
      resources :monsters
      resources :expansions
      resources :epithets

      devise_for :users, controllers: {
        registrations: 'users/registrations'
      }, skip: %i[sessions password]
    end
  end

  get '/me', to: 'application#me', defaults: { format: :json }
end
