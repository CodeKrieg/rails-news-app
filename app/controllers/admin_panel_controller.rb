class AdminPanelController < ApplicationController
  before_filter :authenticate_admin!
  
  def index
  end
  
  def list_users
    @user = User.all.order("created_at desc")
  end
end
