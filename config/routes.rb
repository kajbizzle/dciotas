Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'
  resources :charges
  resources :dues, only: [:index, :show] do
    resources :enrollments, only: :create
  end
end
