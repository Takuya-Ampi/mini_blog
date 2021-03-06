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
  get "/login" => "users#login_form"
  get "/users/:id" => "users#show"
  get "/users/:id/edit" => "users#edit"
  post "/users/:id/destroy" => "users#destroy"
  post "/users/:id/update" => "users#update"
  post "/users/create" => "users#create"
  post "/login" => "users#login"
  post "/logout" => "users#logout"
end
