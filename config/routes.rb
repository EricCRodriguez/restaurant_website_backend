Rails.application.routes.draw do
  namespace :api do
    get "/items" => "items#index"
    post "/items" => "items#create"
    get "/items/:id" => "items#show"
    patch "/items/:id" => "items#update"
    delete "/items/:id" => "items#destroy"

    get "/*path" => proc { [200, {}, [ActionView::Base.new.render(file: "public/index.html")]] }
  end
end
