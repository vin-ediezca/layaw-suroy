class CategoriesController < ApplicationController
  before_action :require_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :cat_find_id, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all.paginate(:page => params[:page], :per_page => 12)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:success] = "New category successfully created"
      redirect_to category_path(@category)
    else
      render 'new'
    end
  end

  def show
    @category_tags = @category.tags.paginate(:page => params[:page], :per_page => 6)
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:success] = "Category successfully updated"
      redirect_to category_path(@category)
    else
      render 'edit'
    end
  end

  def destroy
    @category.destroy
    flash[:info] = "Category successfully deleted"
    redirect_to categories_path
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end

    def cat_find_id
      @category = Category.find(params[:id])
    end
end
