Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'api/v1/user' => 'api/v1/users#create'
  post 'api/v1/sign_in' => 'api/v1/sessions#create'
end
