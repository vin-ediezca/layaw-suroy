class TagsController < ApplicationController
  before_action :require_user, only: [:new, :create, :edit, :update, :destroy, :delete_image_attachment]
  before_action :require_admin, only: [:destroy]
  before_action :tags_find_id, only: [:show, :edit, :update, :destroy]
  before_action :tags_red_val, only: [:show, :edit, :update]

  def index
    @home_banner  = true # allows banner to be displayed if viewed from index
    
    # Disables banner to be displayed while doing search
    unless params[:tag_search].blank? # blank? covers both nil and empty string
      @home_banner  = false
    end
    
    @tags = Tag.search(params[:tag_search]).paginate(:page => params[:page]).order(created_at: :desc)
  end
  
  def show
    @destinations = @tag.destinations
  end
  
  def new
    @tag = Tag.new
  end
  
  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:success] = "New destination tag successfully created"
      redirect_to @tag
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @tag.update(tag_params)
      flash[:success] = "Destination tag successfully updated"
      redirect_to @tag
    else
      render 'edit'
    end
  end

  def destroy
    purge_blog_image(@tag)
    @tag.image_header.purge
    @tag.image_uploads.purge
    @tag.destroy
    flash[:info] = "Destination tag successfully deleted"
    redirect_to root_path
  end

  def delete_image_attachment
    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge
    flash[:info] = "Photo successfully deleted"
    redirect_back(fallback_location: edit_tag_path(session[:for_id]))
  end
  
  private
    def tag_params
      params.require(:tag).permit(:title, :description, :map_embed, :image_header, image_uploads: [])
    end

    def tags_red_val
      session[:for_id] = @tag.id # Stores :for_id value for destinations#new & destination#create
      session[:for_tag_title] = @tag.title # Stores :for_tag_title value for destinations#new & destination#create
      session[:for_tag_description] = @tag.description # Stores :for_tag_description value for destinations#new & destination#create
    end

    def tags_find_id
      @tag = Tag.friendly.find(params[:id])
    end
end
