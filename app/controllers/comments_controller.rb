class CommentsController < ApplicationController

	def create
		parent = params[:parent][:type].constantize.find(params[:parent][:id])

		@comment = parent.comments.new(params[:comment])
		 if @comment.save
	      redirect_to url_to(@comment.parent)
	    else
	      render :new
	    end
	end
end
