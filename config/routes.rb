Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
			namespace :auth do
				resources :session
				namespace :client do
					resources :register
				end

				namespace :pro do
					resources :register
				end
			end

			namespace :user do
					post '/:id/comment', to: 'comment#create', as: :create_comment
					post '/:id/chat', to: 'chat#create', as: :create_chat
					get '/user/index', to: 'user#index', as: :users_index
					get '/user/:id', to: 'user#show', as: :show_user
					get '/chat/index/', to: 'chat#index', as: :chats_index
					get '/ranking/index/', to: 'ranking#index', as: :ranking_index
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
