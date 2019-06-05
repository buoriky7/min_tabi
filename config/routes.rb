Rails.application.routes.draw do
  get 'clip/index'
  get 'article/new'
  get 'article/edit'
  get 'timelines/index'
  get 'timelines/show'
  get 'timelines/edit'
  get 'timelines/new'
  get 'timelines/lanking'
  get 'users/show'
  get 'users/index'
  get 'users/edit'
  get 'users/destroy_confirm'
  get 'homes/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
