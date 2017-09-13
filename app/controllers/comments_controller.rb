class CommentsController < ApplicationController

	def index
		@comm = Comment.all
	end

end