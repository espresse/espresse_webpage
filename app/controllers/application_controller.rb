class ApplicationController < SimpleRackFramework::BaseController
	private
  def title
    @title = "My app"
  end

  def current_user
   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def check_if_authenticated
    unless current_user
      redirect_to url(:root)
    end
  end

end