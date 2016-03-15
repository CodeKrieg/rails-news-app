class UsersController < ApplicationController
  before_filter :admin_authorized, except [:index, :show]
  
  def create
    #
  end
  
  def destroy
    if @user = User.destroy
      flash[:success] = "User Deleted Successfully"
      redirect_to root_path
    else 
      flash[:danger] = "Something went wrong"
  end
end