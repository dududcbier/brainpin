Rails.application.routes.draw do
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
  resources :materials_ratings
  resources :materials
  resources :levels_points
  resources :learnables
  resources :courses_teachers
  resources :courses
  resources :coordinators
  resources :avatars
  resources :avatar_requirements
  resources :db_example
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "db_example#index"
end
