# == Route Map
#
#                   Prefix Verb   URI Pattern                    Controller#Action
#         new_user_session GET    /users/sign_in(.:format)       devise/sessions#new
#             user_session POST   /users/sign_in(.:format)       devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)      devise/sessions#destroy
#            user_password POST   /users/password(.:format)      devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)  devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
#                          PATCH  /users/password(.:format)      devise/passwords#update
#                          PUT    /users/password(.:format)      devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)        devise/registrations#cancel
#        user_registration POST   /users(.:format)               devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)       devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)          devise/registrations#edit
#                          PATCH  /users(.:format)               devise/registrations#update
#                          PUT    /users(.:format)               devise/registrations#update
#                          DELETE /users(.:format)               devise/registrations#destroy
#                    books GET    /books(.:format)               books#index
#                          POST   /books(.:format)               books#create
#                 new_book GET    /books/new(.:format)           books#new
#                edit_book GET    /books/:id/edit(.:format)      books#edit
#                     book GET    /books/:id(.:format)           books#show
#                          PATCH  /books/:id(.:format)           books#update
#                          PUT    /books/:id(.:format)           books#update
#                          DELETE /books/:id(.:format)           books#destroy
#                     root GET    /                              books#index
#

Rails.application.routes.draw do
  devise_for :users
  resources :books

  authenticated :admin do
    resources :books, module: "admin" do
      member do
        patch :publish
        patch :unpublish
      end

      collection do
        patch :publish_all
        post :import
      end
  end


  end

  root to: "books#index"

end
