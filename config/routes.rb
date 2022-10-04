Rails.application.routes.draw do
  # Sessions:
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  
  # Users:
  resources :users
  post '/profile', to: 'users#create'
  patch '/profile/edit', to: 'users#update'
  delete '/profile', to: 'users#destroy'
  get '/profile', to: 'users#show'
  get '/my-lawyer-profile', to: "users#get_users_lawyer"
  get '/lawyer-photo', to: "users#get_user_photo"

  # Reviews:
  post '/reviews/new', to: 'reviews#create'
  get '/reviews/lawyer/:id', to: 'reviews#index'
  get '/review/:id', to: 'reviews#show'
  delete 'review/:id', to: 'reviews#destroy'

  # Lawyers:
  resources :lawyers 
  post '/lawyers/new' => 'lawyers#create'

  # Questions:
  get '/questions', to: 'questions#index'
  post '/questions/new', to: 'questions#create'
  get '/questions/user/:id', to: 'questions#get_user_questions'
  get '/question/:id', to: 'questions#show'
  get '/question/answers/:id', to: 'questions#get_question_answers'

  # Answers
  post 'answers/new', to: 'answers#create'
  get 'answers', to: 'answers#index'
  get 'answer/:id', to: 'answers#show'
  get 'answers/lawyer/:id', to: 'answers#get_lawyer_answers'

  # Photos
  post 'photo/new', to: 'photo#create'

end
