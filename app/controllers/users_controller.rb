class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :set_user, only: [:edit, :update, :show]
  before_action :category
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to the Revakhand Today website #{@user.username}"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = "Your account was updated successfully"
      redirect_to users_path
    else
      render 'edit'
    end
  end
  
  def show
    
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:danger] = "User and all articles created by user have been deleted"
    redirect_to users_path
  end
  
  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :role)
  end
  def set_user
    @user = User.find(params[:id])
  end
end