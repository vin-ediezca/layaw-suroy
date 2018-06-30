class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end
  
  def show
    @tag = Tag.find(params[:id])
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
  
  private
    def tag_params
      params.require(:tag).permit(:title, :image_header, :description)
    end
end
