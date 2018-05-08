Rails.application.routes.draw do
  resources :pages
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get '/companies/import', to: 'companies#import_form', as: 'import_form'
  post '/companies/import_xls', to: 'companies#import_xls', as: 'import_companies'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
