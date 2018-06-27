Rails.application.routes.draw do
  resources :multistep_forms

  get '/form_preview' => "multistep_submissions#multistep_form_preview"
  post '/save_multiplestep_form' => "multistep_submissions#save_multiplestep_form"
  resources :submissions, only: [:index, :show]
    devise_for :users, controllers: {
      sessions: 'users/sessions'
    }
   
  resources :basic_forms do 
    member do 
      get :preview_form
      get :submissions
    end
    collection do 
      post :collect_user_response
    end
  end
  resources :custom_forms
  resources :feedback_forms
  root 'home#index'

  resources :forms
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
