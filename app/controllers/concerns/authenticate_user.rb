module AuthenticateUser
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

  def check_dest_creator
    @destination = Destination.friendly.find(params[:id])
    unless @destination.tag.user == current_user
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  def check_tag_creator
    @tag = Tag.friendly.find(params[:id])
    unless @tag.user == current_user
      raise ActionController::RoutingError.new('Not Found')
    end
  end
end