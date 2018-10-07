class SessionsController < ApplicationController
  before_action :require_no_user, only: [:new, :create]

  def new
  end
  
  def create
    puts params[:email]
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:danger] = "Invalid email or password"
      redirect_to admin_path
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:info] = "You have successfully logged out"
    redirect_to admin_path
  end
end
