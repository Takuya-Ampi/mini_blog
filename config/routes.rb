Rails.application.routes.draw do
  get "/" => "home#top"

  #posts
  get "/posts/index" => "posts#index"
  get "/posts/new" => "posts#new"
  get "/posts/:id" => "posts#show"
  get "/posts/:id/edit" => "posts#edit"
  post "/posts/create" => "posts#create"
  post "/posts/:id/destroy" => "posts#destroy"
  post "/posts/:id/update" => "posts#update"

  #users
  get "/users/index" => "users#index"
  get "/signup" => "users#new"

end
