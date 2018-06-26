Rails.application.routes.draw do
  get 'sessions/new'
  resources :posts
  resources :comments
  resources :wrong_answers
  resources :right_answers
  resources :solutions
  resources :mongo_questions
  resources :users
  resources :topics
  resources :teachers_titles
  resources :teachers
  resources :subtopics_questions
  resources :subtopics
  resources :study_sessions
  resources :students
  resources :student_levels
  resources :registrants
  resources :questions_study_sessions
  resources :questions
  resources :materials
  resources :learnables
  resources :courses_teachers
  resources :courses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get  'static_pages/home'
  root 'static_pages#home'
end
