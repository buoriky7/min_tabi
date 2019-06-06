Rails.application.routes.draw do
  get 'articles/new'
  get 'articles/edit'
  get 'clips/index'
  resources :clips, only:[:index, :create, :destroy, :update]
  # get '/clips/current_user'
  # get '/clips/other'
  resources :articles, only:[:new, :create, :edit, :update, :destroy]
  resources :timelines
  get 'timelines/lanking_clip', as: 'lanking_clip'
  # get '/lankings/article', as: 'lanking_article'
  resources :places, only:[:new, :create, :destroy, :update]
  devise_for :users
  resources :users, only:[:index, :show, :edit, :update, :destroy]
  get 'users/destroy_confirm'
  resource :homes, only: [:index]
  root 'homes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
