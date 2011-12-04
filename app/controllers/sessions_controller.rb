class SessionsController < ApplicationController
  before_filter :check_if_authenticated, :only => [:destroy]

  def new
    render :new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    unless user.nil?
      session[:user_id] = user.id
      redirect_to url(:root)
    else
      flash[:error] = "Wrong username or password."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to url(:root)
  end

end