class DestinationsController < ApplicationController
  before_action :require_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :dest_find_id, only: [:edit, :update, :destroy]
  before_action :dest_red_val, only: [:new, :create, :edit, :update]


  def new
    @destination = Destination.new
  end
  
  def create
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
  end
  
  def update
    @destination.last_update_by = current_user.first_name + " " + current_user.last_name
    
    if @destination.update(destination_params)
      flash[:success] = "Blog successfully updated"
      redirect_to tag_path(id: @tag_id )
    else
      render 'edit'
    end
  end
  
  def destroy
    @destination.blog_image.purge
    @destination.destroy
    
    flash[:notice] = "A blog was successfully deleted"
    redirect_to tag_path(id: @destination.tag_id)
  end
  
  private
    def destination_params
      params.require(:destination).permit(:tag_id, :blog_title, :blog_body, :created_by, :last_update_by, :blog_image)
    end

    def dest_find_id
      @destination = Destination.friendly.find(params[:id])
    end

    def dest_red_val
      @tag_id = session[:for_id] # for cancel redirection
      @tag_title = session[:for_tag_title] # views Tag title
      @tag_description = session[:for_tag_description] # views Tag description
    end
end
