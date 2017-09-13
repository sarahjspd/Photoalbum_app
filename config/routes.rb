Rails.application.routes.draw do

	root to: "comments#index"

	resources :photoalbums, only: [:show, :index, :new, :create, :edit, :update, :destroy] do

		resources :photos do

			resource :comments

		end

	end


end 




