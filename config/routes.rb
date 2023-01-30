Rails.application.routes.draw do
      namespace :api do
            namespace :v1 do
                  namespace :auth do
                        resources :sessions
                        resources :registers
                  end
            end
      end
end
