Rails.application.routes.draw do

  resources :instructors
  resources :courses
  resources :subjects
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'subjects#index'

  get  'course_list',    to: 'courses#index'
  get  'subject_list',    to: 'subjects#index'
  get  'instructor_list',    to: 'instructors#index'
end
