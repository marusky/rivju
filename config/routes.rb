Rails.application.routes.draw do
  get 'dashboard', to: 'pages#dashboard'
  resources :submissions
  resources :tasks
  get 'course_choice', to: 'tasks#course_choice'
  get 'assignment_choice', to: 'tasks#assignment_choice'
  resources :assignments, except: :index
  resources :courses
  resources :classrooms
  resources :projects, only: :show
  devise_for :users, path: '',
             path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' },
             controllers: {
               registrations: 'users/registrations',
               invitations: 'users/invitations'
             }

  root to: "pages#home"
end
