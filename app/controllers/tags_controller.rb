class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end
  
  def show
    @tag = Tag.find(params[:id])
    @destinations = @tag.destinations
    session[:for_id] = @tag.id
    session[:for_tag_title] = @tag.title
    session[:for_tag_description] = @tag.description
  end
  
  def new
    @tag = Tag.new
  end
  
  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:notice] = "New tag successfully created"
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  def edit
    @tag = Tag.find(params[:id])
  end
  
  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end
  
  private
    def tag_params
      params.require(:tag).permit(:title, :description, :image_header, image_uploads: [])
    end
end
