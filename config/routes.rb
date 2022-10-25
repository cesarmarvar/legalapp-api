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
  get '/user/photo', to: "users#get_user_photo"

  # Reviews:
  post '/reviews/new', to: 'reviews#create'
  get '/reviews/lawyer/:id', to: 'reviews#index'
  get '/review/:id', to: 'reviews#show'
  delete 'review/:id', to: 'reviews#destroy'

  # Lawyers:
  resources :lawyers 
  post '/lawyers/new' => 'lawyers#create'
  get '/lawyers-searchquery' => 'lawyers#query_filter'
  get '/lawyer/photo/:id', to: "lawyers#get_lawyer_photo"
  
  # Questions:
  get '/questions', to: 'questions#index'
  post '/questions/new', to: 'questions#create'
  get '/questions/user/:id', to: 'questions#get_user_questions'
  get '/question/:id', to: 'questions#show'
  get '/question/answers/:id', to: 'questions#get_question_answers'
  delete 'question/:id', to: 'questions#destroy'

  # Answers
  post 'answers/new', to: 'answers#create'
  get 'answers', to: 'answers#index'
  get 'answer/:id', to: 'answers#show'
  get 'answers/lawyer/:id', to: 'answers#get_lawyer_answers'
  delete 'answer/:id', to: 'answers#destroy'

  # Photos
  post 'photo/new', to: 'photos#create'

  # Specialities
  post 'specialities/new', to: 'specialities#create'
  get 'specialities', to: 'specialities#index'
  delete 'speciality/:id', to: 'specialities#destroy'

  # Contacts
  post 'contacts/new', to: 'contacts#create'
  get 'contacts', to: 'contacts#index'
  get 'contacts/:id', to: 'contacts#show'
  delete 'contacts/:id', to: 'contacts#destroy'

  # Lawyer specialities
  post 'lawyer-specialities/new', to: 'lawyer_specialities#create'
  delete 'lawyer-specialities/:id', to: 'lawyer_specialities#destroy'

end
