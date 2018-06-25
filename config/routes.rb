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
  resources :materials
  resources :learnables
  resources :courses_teachers
  resources :courses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
