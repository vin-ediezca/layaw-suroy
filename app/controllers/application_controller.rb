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
    redirect_to '/admin' unless current_user
  end
  
  def require_editor
    redirect_to '/' unless current_user.editor?
  end
  
  def require_admin
    redirect_to '/' unless current_user.admin?
  end
  
  def check_user
    @user = User.friendly.find(params[:id])
    unless @user == current_user
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  # Delete blog images through tags controller
  def purge_blog_image(p)
    @destinations = Destination.find_by_tag_id(p)
    if @destinations
      @destinations.blog_image.purge
    end
  end
end
