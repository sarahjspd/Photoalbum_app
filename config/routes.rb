Rails.application.routes.draw do

  devise_for :users
	root to: "photoalbums#index"

	resources :photoalbums, only: [:show, :index, :new, :create, :edit, :update, :destroy] do

		resources :photos do

			resource :comments

		end

	end


end 




