class ApplicationController < SimpleRackFramework::BaseController
	private
  
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user ||= Guest.new
    end
  end

  def check_if_authenticated
    unless current_user.is_user?
      flash[:alert] = "You need to log-in to get access to that action."
      redirect_to url(:root)
    end
  end

  def check_if_authorized
    unless current_user.is_admin?
      flash[:alert] = "This action is restricted to privileged users!"
      redirect_to url(:root)
    end    
  end

end