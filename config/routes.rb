Rails.application.routes.draw do
  
  resources :tasks do
    put :sort, on: :collection
  end
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
      get :submission_data_to_csv
    end
    collection do 
      post :collect_user_response
    end
    put :sort_blocks, on: :collection
    put :sort_multiple_choices, on: :collection
    put :sort_checkbox_questions, on: :collection
  end
  resources :custom_forms
  resources :feedback_forms
  root 'home#index'

  resources :forms
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
