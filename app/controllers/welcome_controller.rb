class WelcomeController < ApplicationController
  
  def index
    @article = Article.all.order("created_at desc")
    @ad = Ad.all.order("created_at desc").limit(3)
    @categories = Category.all.order("created_at desc")
    #@category = Category.includes(:articles).find(5)
  end
  
end