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

	def edit
		@photoal = Photoalbum.find_by(id: params[:id])
	end

	def update
		post_params = params.require(:photoalbum).permit(:title, :description)
		@photoal = Photoalbum.find(params[:id])
		if @photoal.update(post_params)
			flash[:notice] = "Successfully Updated"
			redirect_to photoalbum_path(id: @photoal.id)
		else
			flash.now[:notice] = "Not Successfully Updated"
			render :edit
		end
	end

	def destroy
		@photoal = Photoalbum.find(params[:id])
		if @photoal.destroy
			flash[:notice] = "Photoalbum deleted successfully"
			redirect_to photoalbums_path
		end
	end


end



















