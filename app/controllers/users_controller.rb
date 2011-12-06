class UsersController < ApplicationController
  before_filter :check_if_authenticated, :only=>[:show]

  def show
    @user = current_user
    render :json => @user
  end

  def new
    unless current_user.is_user?
      @user = User.new
      render :new
    else
      redirect_to url(:root)
    end
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to url(:root)
    else
      render :new
    end
  end
end
