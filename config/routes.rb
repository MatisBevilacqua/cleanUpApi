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

			namespace :user do
				namespace :pro do
					post '/:id/comments', to: 'comments#create', as: :create_comment
					get '/users/:id', to: 'users#show', as: :show_user
					#get 'comments/index/:user_id', to: 'comments#index', as: 'comments_index'
				end
			end
		end
	end

	namespace :api do
		namespace :v1 do
		  namespace :test do
			resources :tests
		  end
		end
	end
end
