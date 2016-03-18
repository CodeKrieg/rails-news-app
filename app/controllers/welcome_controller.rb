class WelcomeController < ApplicationController
  
  def index
    @article = Article.all.order("created_at desc")
  end
  
end