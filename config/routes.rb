Rails.application.routes.draw do

	root to: "photoalbums#index"

	resources :photoalbums, only: [:show, :index, :new, :create, :edit, :update, :destroy]

end



