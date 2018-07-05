class UsersController < ApplicationController
  before_action :require_user, only: [:new, :create, :show, :edit, :update, :account]
  before_action :require_admin, only: [:new, :create, :show]
  before_action :check_user, only: [:account, :edit, :update]

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
  
  def show
    @user = User.all
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    user = User.find_by_email(current_user.email).try(:authenticate, params[:current_password])
    if user && @user.update(user_params)
      flash[:notice] = "Password successfully changed"
      redirect_to user_account_path(id: current_user.id)
    else
      flash[:error] = "Invalid old password"
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
