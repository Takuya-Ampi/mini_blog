Rails.application.routes.draw do
  get "/" => "home#top"

  #posts
  get "/posts/index" => "posts#index"
  get "/posts/new" => "posts#new"
  get "/posts/:id" => "posts#show"
  get "/posts/:id/edit" => "posts#edit"
  post "/posts/:id/destroy" => "posts#destroy"
  post "/posts/:id/update" => "posts#update"
  post "/posts/create" => "posts#create"

  #users
  get "/users/index" => "users#index"
  get "/signup" => "users#new"
  get "/users/:id" => "users#show"
  get "/users/:id/edit" => "users#edit"
  post "/users/create" => "users#create"
  post "/users/:id/destroy" => "users#destroy"

end
