Rails.application.routes.draw do
  get 'clips/user' => 'clips#index_user', as: 'clips_user'
  get 'clips/other' => 'clips#index_other', as: 'clips_other'
  post 'clips/:id' => 'clips#create', as: 'clips_create'
  # テストclip
  post 'test_clips/:timeline_id' => 'clips#test_create', as: 'test_clip'
  delete 'test_clips/:timeline_id' => 'clips#test_destroy', as: 'test_clip_d'
  # テストclip
  resources :articles, only:[:new, :create, :edit, :update, :destroy]
  get 'timelines/ranking_clip' => 'timelines#ranking_clip', as: 'ranking_clip'
  get 'timelines/ranking_article' => 'timelines#ranking_article', as: 'ranking_article'
  patch 'timelines/:id/post' => 'timelines#post', as: 'timeline_post'
  get 'timelines/new/:id' => 'timelines#new', as: 'new_timeline'
  get 'timelines/user/:id' => 'timelines#index_user', as: 'timelines_user'
  get 'timelines/other' => 'timelines#index_other', as: 'timelines_other'
  resources :timelines, only: [:index, :create, :show, :destroy, :update] do
    resources :clips, only:[:create, :destroy]
  end
  resources :clips, only:[:index]
  resources :places, only:[:new, :create, :destroy, :update]
  devise_for :users
  get 'users/index_desc' => 'users#index_desc', as: 'users_index_desc'
  get 'users/:id/destroy_confirm' => 'users#destroy_confirm', as: 'destroy_confirm'
  resources :users, only:[:index, :show, :edit, :update, :destroy]
  resource :homes, only: [:index]
  root 'homes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
