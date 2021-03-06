class CategoriesController < ApplicationController
  load_and_authorize_resource
  before_action :category
  
  def index
    @ad = Ad.all.order("created_at desc").limit(3)
  end
  
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category was created successfully"
      redirect_to categories_path
    else
      render 'new'
    end
  end
  
  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:success] = "Category name was successfully updated"
      redirect_to category_path(@category)
    else
      render 'edit'
    end
  end
  
  def show
    @category = Category.find(params[:id])
    @category_articles = @category.articles
    @ad = Ad.all.order("created_at desc").limit(3)
  end
  
  def destroy
    @category.destroy
    redirect_to categories_path
  end
  
  private
  
  def category_params
    params.require(:category).permit(:name)
  end
end
