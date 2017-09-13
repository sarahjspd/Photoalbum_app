Rails.application.routes.draw do

	root to: "photoalbums#index"


	resources :users, only: [:show, :index, :new, :create, :edit, :update, :destroy] do

	resources :photoalbums, only: [:show, :index, :new, :create, :edit, :update, :destroy]

end 
end



