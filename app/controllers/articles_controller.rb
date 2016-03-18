class ArticlesController < ApplicationController
  load_and_authorize_resource
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  
  def index
    @article = Article.all.order("created_at desc")
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
    
    if @article.save
      redirect_to @article, notice: "Your article was successfully saved!"
    else
      render 'new', notice: "Your article could not be saved!"
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @article.update(article_params)
      redirect_to @article, notice: "This article was successfully updated"
    else
      render 'edit'
    end
  end
  
  def destroy
    @article.destroy
    flash[:danger] = "Article Deleted Successfully"
    redirect_to articles_path
  end
  
  private
  
  def article_params
    params.require(:article).permit(:title, :description, :featured, category_ids: [])
  end
  
  def find_article
     @article = Article.find(params[:id]) 
  end
  
end
