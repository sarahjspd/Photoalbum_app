class PhotoalbumsController < ApplicationController

	def index
		@photoal = Photoalbum.all
		@phot = Photo.all
	end

	def new
		@photoal = Photoalbum.new
	end

	def create
		post_params = params.require(:photoalbum).permit(:title, :description)
		@photoal = Photoalbum.new(post_params)
		@photoal.user_id = current_user.id
		if @photoal.save
			flash[:notice] = 'Successfully Created!'
			redirect_to photoalbums_path
		else
			flash.now[:notice] = 'Not successfully created, please check your input.'
			render :new #when you type new, this looks for app/view/posts/new.html.erb
		end

	end


	def show
		@photoal = Photoalbum.find_by(id: params[:id])
		@phot = Photo.new
		if @phot.save
			flash.now[:notice] = "Successfully Created!"
			redirect_to photoalbum_photo_path(id: @photo.id)
		end

	end


end
