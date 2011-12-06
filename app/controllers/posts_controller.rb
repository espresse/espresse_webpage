class PostsController < ApplicationController
	before_filter :check_if_authorized, :except=>[:index, :show]
	before_filter :find_post, :only => [:show, :edit, :update, :destroy]
	def index
		if current_user.is_admin?
			@posts = Post.all.desc(:created_at)
		else
			@posts = Post.published.desc(:created_at)
		end
		render :index
	end

	def show
		render :show
	end

	def new
		@post = Post.new
		render :new
	end

	def create
		@post = Post.new(params[:post])
	    if @post.save
	      redirect_to url_to(@post)
	    else
	      render :new
	    end
	end

	def edit
		render :edit
	end

	def update
		if @post.update_attributes(params[:post])
		  flash[:notice] = "Post has been updated correctly"
	      redirect_to url_to(@post)
	    else
	      render :edit
	    end
	end

	def destroy
		@post.destroy
		redirect_to url(:posts)
	end

	private

	def find_post
		@post = Post.where(:permalink => params[:id]).first
	end
end