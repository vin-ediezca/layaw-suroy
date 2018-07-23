class DestinationsController < ApplicationController
  before_action :require_user, only: [:new, :create, :edit, :update, :destroy]

  def new
    @tag_id = session[:for_id] # for cancel redirection
    @tag_title = session[:for_tag_title] # views Tag title
    @tag_description = session[:for_tag_description] # views Tag description
    @destination = Destination.new
  end
  
  def create
    @tag_id = session[:for_id] # for cancel redirection
    @tag_title = session[:for_tag_title] # views Tag title
    @tag_description = session[:for_tag_description] # views Tag description
    @destination = Destination.new(destination_params)
    @destination.tag_id = @tag_id
    @destination.created_by = current_user.first_name + " " + current_user.last_name
    @destination.last_update_by = current_user.first_name + " " + current_user.last_name
    
    if @destination.save
      flash[:success] = "New blog successfully added"
      redirect_to tag_path(id: @destination.tag_id)
    else
      render 'new'
    end
  end
  
  def edit
    @destination = Destination.find(params[:id])
    @tag_id = @destination.tag_id # for cancel redirection
    @tag_title = session[:for_tag_title] # views Tag title
  end
  
  def update
    @destination = Destination.find(params[:id])
    @tag_id = @destination.tag_id # for cancel redirection
    @tag_title = session[:for_tag_title] # views Tag title
    @destination.last_update_by = current_user.first_name + " " + current_user.last_name
    
    if @destination.update(destination_params)
      flash[:success] = "Blog successfully updated"
      redirect_to tag_path(id: @tag_id )
    else
      render 'edit'
    end
  end
  
  def destroy
    @destination = Destination.find(params[:id])
    @destination.destroy
    
    flash[:notice] = "A blog was successfully deleted"
    redirect_to tag_path(id: @destination.tag_id)
  end
  
  private
    def destination_params
      params.require(:destination).permit(:tag_id, :blog_title, :blog_body, :created_by, :last_update_by, :blog_image)
    end
end
