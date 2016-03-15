class UsersController < ApplicationController
  before_filter :admin_authorized, except [:index, :show]
  
  def create_table
    #
  end
end