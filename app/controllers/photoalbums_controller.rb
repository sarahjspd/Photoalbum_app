class PhotoalbumsController < ApplicationController

	def index
		@photoal = Photoalbum.all
	end


end


