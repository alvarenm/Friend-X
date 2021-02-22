Rails.application.routes.draw do
  root "home#index"
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations'}
  resource :modal do
    get :show_register, controller: :modal
    get :show_main, controller: :modal
  end

  resource :plays do
    post :create, controller: :plays
  end
  
  resource :groups do
    get :show, controller: :groups
    post :create, controller: :groups
  end
end
