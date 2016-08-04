Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post '/state_logs' => 'user#state_logs'
      post '/user/validate' => 'user#login'
      get '/state_logs/between/:from_date/:to_date' => 'user#state_logs_between'
    end
  end
end
