Rails.application.routes.draw do
  root "home#index"
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations'}
  resource :modal do
    get :show_register, controller: :modal
    get :show_main, controller: :modal
  end
end
