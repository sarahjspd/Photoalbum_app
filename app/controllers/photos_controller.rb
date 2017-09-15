class PhotosController < ApplicationController

	def index
		@phot = Photo.all
	end

	def new
		@photoal = Photoalbum.find_by(id: params[:photoalbum_id])
		@phot = Photo.new
	end

	def create
		@photoal = Photoalbum.find(params[:photoalbum_id])
		photo_params = params.require(:photo).permit(:title, :description, :image) 
		@phot = @photoal.photos.build(photo_params)

		if @phot.save
			flash[:notice] = 'Successfully Created!!'
			redirect_to photoalbum_path(id: @photoal.id)
		else
			flash.now[:notice] = 'Not Successfully Created, Try Again'
			render :new
		end
	end

	def show
		@photoal = Photoalbum.find(params[:photoalbum_id])
		@phot = Photo.find_by(id: params[:id])

	end


end