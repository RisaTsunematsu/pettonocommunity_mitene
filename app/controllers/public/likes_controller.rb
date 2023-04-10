class Public::LikesController < ApplicationController
 before_action :authenticate_user!
 
 def create
    @post = Post.find(params[:post_id])
    current_user.likes.find_or_create_by(post_id: @post.id)
 end

  def destroy
    @post = Post.find(params[:post_id])
    like = current_user.likes.find_by(post_id: @post.id)
    like.destroy if like
  end
end

