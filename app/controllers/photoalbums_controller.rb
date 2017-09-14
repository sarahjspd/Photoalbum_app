class PhotoalbumsController < ApplicationController

	def index
		@photoal = Photoalbum.all
	end


end

# You can use your uploader class to store and retrieve files like this:

# uploader = AvatarUploader.new

# uploader.store!(my_file)

# uploader.retrieve_from_store!('my_file.png')
