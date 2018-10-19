Rails.application.routes.draw do

  resources :models
  resources :enrollments
  resources :instructors
  resources :courses
  resources :subjects
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'subjects#index'
  root 'courses#index'
  get  'course_list',    to: 'courses#index'
  get  'subject_list',    to: 'subjects#index'
  get  'instructor_list',    to: 'instructors#index'
  get  '/signup',  to: 'users#signup'
  get  '/login',  to: 'users#login'
  get  '/check_login',  to: 'users#check_login'
end
