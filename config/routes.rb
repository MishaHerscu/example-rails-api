Rails.application.routes.draw do
  resources :hire_recommendations, except: [:new, :edit]
  resources :content_recommendations, except: [:new, :edit]
  resources :trust_links, except: [:new, :edit]
  resources :trust_types, except: [:new, :edit]
  resources :companies, except: [:new, :edit]
  resources :content_posts, except: [:new, :edit]
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  post '/update-recommendations/:id' => 'users#update_recommendations'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  resources :users, except: [:new, :edit]
end
