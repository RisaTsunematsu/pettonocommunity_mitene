class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @posts = Post.page(params[:page]).per(10)
  end
  
  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to admin_posts_path
  end
end