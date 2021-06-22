Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
  get 'sessions/new'
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy]
  resources :contacts
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  resources :feeds do 
    collection do
      post :confirm
    end
  end
end
