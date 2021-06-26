Rails.application.routes.draw do
root 'users#new'
  get 'sessions/new'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  resources :feeds do 
    collection do
      post :confirm
    end
  end
end

