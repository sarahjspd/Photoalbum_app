Rails.application.routes.draw do

  devise_for :users
	root to: "photoalbums#index"

	resources :photoalbums do

		resources :photos do

			resource :comments

		end

	end


end 




