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
		end
	end

	namespace :api do
		namespace :v1 do
		  namespace :profil do
			post '/:id/comments', to: 'comments#create', as: :create_comment
      		get '/:id/comments/:id', to: 'comments#show', as: :show_comment
		  end
		end
	end
end
