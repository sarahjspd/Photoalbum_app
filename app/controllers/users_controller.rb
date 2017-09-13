class UsersController < ApplicationController


	def index
		@use = User.all

end
end