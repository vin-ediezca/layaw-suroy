class UsersController < ApplicationController
  before_action :require_user, only: [:new, :create, :account]
  before_action :require_admin, only: [:new, :create]

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      # uncomment line if you want to redirect to new user after save
      # session[:user_id] = @user.id
      flash[:notice] = "New user successfully created"
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Password successfully changed"
      redirect_to user_account_path(id: current_user.id)
    else
      render 'edit'
    end
  end
  
  def account
    @account = User.find(params[:id])
  end
  
  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :role)
    end
end
