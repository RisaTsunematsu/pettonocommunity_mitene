class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @users = User.page(params[:page]).per(10)
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to admin_users_path
  end
end

