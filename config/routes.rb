Rails.application.routes.draw do
      namespace :api do
            namespace :v1 do
                  namespace :auth do
                        namespace :client do
                              resources :sessions
                              resources :registers
                        end
                  end
            end
      end

      namespace :api do
            namespace :v1 do
                  namespace :auth do
                        namespace :pro do
                              resources :sessions
                              resources :registers
                        end
                  end
            end
      end

      namespace :api do
            namespace :v1 do
                  namespace :cmts do
                        resources :stars
                  end
            end
      end
end
