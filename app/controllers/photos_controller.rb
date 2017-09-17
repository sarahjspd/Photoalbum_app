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
		# @a = distance_of_time_in_words(time.now, @phot.updated_at.localtime)

	end

	def edit
		@photoal = Photoalbum.find(params[:photoalbum_id])
		@phot = Photo.find_by(id: params[:id])
	end

	def update
		@photoal = Photoalbum.find(params[:photoalbum_id])
		@phot = Photo.find_by(id: params[:id])
		post_params = params.require(:photo).permit(:title, :description, :image)
		if @phot.update(post_params)
			# if i put @photoal.update(post_params) it still works! why?
			flash[:notice] = "Successfully Updated"
			redirect_to photoalbum_photo_path(photoalbum_id: @photoal.id, id: @phot.id)
		else
			flash[:notice] = "Not Successfully Updated"
			render :edit
		end
	end

	def destroy
		@photoal = Photoalbum.find(params[:photoalbum_id])
		@phot = Photo.find_by(id: params[:id])
		if @phot.destroy
			flash[:notice] = "Successfully Deleted"
			redirect_to photoalbum_path(id: @photoal.id)
		end

	end


















end