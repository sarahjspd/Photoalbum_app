class CommentsController < ApplicationController

	def index
		@photoal = Photoalbum.find(params[:photoalbum_id])
		@phot = Photo.find(params[:photo_id])
		@comm = Comment.all
		
	end


	def new
		
		@photoal = Photoalbum.find(params[:photoalbum_id])
		@phot = Photo.find(params[:photo_id])
		@comm = Comment.new
		
	end


	def create
		@photoal = Photoalbum.find(params[:photoalbum_id])
		@phot = Photo.find(params[:photo_id])
		comm_params = params.require(:comment).permit(:body)	
		@comm = Comment.new(comm_params)
		@comm.user = current_user
		@comm.photo = @phot
#		@comm = current_user.comments.build(comm_params)
		if @comm.save
			flash[:notice] = 'Successfully Created!!'
			redirect_to photoalbum_photo_path(photoalbum_id: @photoal.id, id: @phot.id)
		else
			flash.now[:notice] = 'Not Successfully Created, Try Again'
			render 'photos/show'
		end
	end
	


 	def edit
 		@photoal = Photoalbum.find(params[:photoalbum_id])
        @phot = Photo.find(params[:photo_id])
        @comm = Comment.find_by(params[:id])
       
    end    

	def update
        comm_params = params.require(:comment).permit(:user_id, :body)
        @comm = Comment.find_by(params[:id])
        @phot = Photo.find(params[:photo_id])
        @photoal = Photoalbum.find(params[:photoalbum_id])
		if @comm.update(comm_params)
            flash[:success] = "Post updated successfully"
            redirect_to photoalbum_photo_path(photoalbum_id: @photoal.id, id: @photo.id)          
        end    
    end



	def show
		@photoal = Photoalbum.find(params[:photoalbum_id])
		@phot = Photo.find(params[:photo_id])
		@comm = Comment.new

	end




	def destroy
		@photoal = Photoalbum.find(params[:photoalbum_id])
        @phot = Photo.find(params[:photo_id])
        @comm = Comment.find_by(id: params[:id])
		if @comm.destroy
			flash[:notice] = "Successfully Deleted"
			redirect_to photoalbum_photo_path(photoalbum_id: @photoal.id, id: @phot.id) 
		end
	end
end
	






