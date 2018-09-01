class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :current_user
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def require_no_user
    redirect_to '/' if current_user
  end
  
  def require_user
    redirect_to '/login' unless current_user
  end
  
  def require_editor
    redirect_to '/' unless current_user.editor?
  end
  
  def require_admin
    redirect_to '/' unless current_user.admin?
  end
  
  def check_user
    @user = User.find(params[:id])
    unless @user == current_user
      flash[:danger] = "You are not clever as you think you are ;)"
      redirect_to user_account_path(id: current_user)
    end
  end

  # Delete blog images through tags controller
  def purge_blog_image(p)
    @destinations = Destination.find_by_tag_id(p)
    @destinations.blog_image.purge
  end

end
