Rails.application.routes.draw do
  root to: "pages#home"

  #Login/logout (session) routes
  get "/login" => "session#new"         # show login form
  post "/login" => "session#create"     # form submit, perform login, redirect
  delete "/login" => "session#destroy"  # logout link, perform logour, redirect

  resources :decks, :users, :cards

  get "/decks/:id/play" => "decks#play", as: "play"
  # route to alter the user confidence in a card
  put "/cards/:id/confidence/:num" => "cards#confidence", as: "confidence"
end #routes
