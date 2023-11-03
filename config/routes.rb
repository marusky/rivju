Rails.application.routes.draw do
  resources :classrooms
  devise_for :users, path: '',
             path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' },
             controllers: {
               registrations: 'users/registrations',
               invitations: 'users/invitations'
             }

  root to: "pages#home"
end
