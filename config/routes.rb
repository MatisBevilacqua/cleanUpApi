Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
			namespace :auth do
				namespace :client do
					resources :sessions
					resources :registers
				end

				namespace :pro do
					resources :sessions
					resources :registers
				end
			end

			namespace :usr do
				resources :users
			end
		end
	end
end
