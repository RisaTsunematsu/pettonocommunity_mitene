class Admin::PostCommentsController < ApplicationController
  
   def index
    @comments = Comment.page(params[:page]).per(10)
   end
  
   def destroy
    Comment.find(params[:id]).destroy
    flash[:success] = "Comment deleted"
    redirect_to admin_post_comments_path
   end
end
