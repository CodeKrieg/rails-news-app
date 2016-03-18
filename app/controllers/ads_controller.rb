class AdsController < ApplicationController
  load_and_authorize_resource
  before_action :find_ad, only: [:show, :edit, :update, :destroy]
  
  def index
    @ad = Ad.all.order("created_at desc")
  end
  
  def new
    @ad = Ad.new
  end
  
  def create
    @ad = Ad.new(ad_params)
    
    if @ad.save
      redirect_to @ad, notice: "Your Ad was successfully saved!"
    else
      render 'new', notice: "@ad.errors.full_messages"
      
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @ad.update(ad_params)
      redirect_to @ad, notice: "This Ad was successfully updated"
    else
      render 'edit'
    end
  end
  
  def destroy
    @ad.destroy
    flash[:danger] = "Ad has been deleted"
    redirect_to ads_path
  end
  
  private
  
  def ad_params
    params.require(:ad).permit(:title, :url, :html, :image)
  end
  
  def find_ad
     @ad = Ad.find(params[:id]) 
  end
  
end
