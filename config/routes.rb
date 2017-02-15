Rails.application.routes.draw do
root 'doctors#index'

resources :patients
resources :doctors
resources :appointments, only: [:new, :edit, :update, :create, :destroy]
end
