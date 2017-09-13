class PhotosController < ApplicationController

	def index
		@phot = Photo.all
	end

end