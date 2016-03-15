class AdsController < ApplicationController
  before_filter :authenticate_admin!, except: [:show]
  before_action :find_ad, only: [:show, :edit, :update, :destroy]
  

  def index
    @ads = Ad.all.order("created_at desc")
  end
  
  def new
    @ad = Ad.new
  end
  
  def create 
    @ad = Ad.new(ads_params)
    if @ad.save
      flash[:success] = "Ad Created and Added successfully"
      redirect_to root_path
    end
  end
  
  def show
    
  end
  
  def edit
  end
  
  def update
    if @ad.update(ads_params)
      redirect_to @ad, notice: "This ad has been updated successfully"
    else
      render 'edit'
    end
  end
  
  def destroy
    @ad.destroy
    redirect_to ads_path
  end
  
  private
  
    def ads_params
      params.require(:ad).permit(:title, :url)
    end
    
    def find_ad
     @ad = Ad.find(params[:id]) 
    end
      
  end
