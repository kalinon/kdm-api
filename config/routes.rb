Rails.application.routes.draw do
  resources :gear_types
  resources :resource_types
  resources :locations
  resources :survival_actions
  resources :weapon_proficiencies
  resources :cause_of_deaths
  resources :monsters
  resources :expansions
  resources :epithets
end
