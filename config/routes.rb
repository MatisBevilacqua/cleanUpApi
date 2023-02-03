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
					post '/:id/comments', to: 'comments#create', as: :create_comment
					post '/:id/chats', to: 'chats#create', as: :create_chat
					get '/users/index', to: 'users#index', as: :users_index
					get '/users/:id', to: 'users#show', as: :show_user
					get '/chats/index/', to: 'chats#index', as: :chats_index
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
