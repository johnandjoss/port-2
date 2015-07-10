class PostsController < ApplicationController
	

	def index
		@posts = Post.all.order("created_aat DESC")
	end

end
