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
    user = current_user
    post_ids = user.likes.pluck(:post_id)
    # post_ids = Like.where(user_id: params[:user_id]).pluck(:post_id) #全部のいいねからuser_idカラムの値がparams[:user_id]のlikeをwhereで絞り込む
    # いいねを外した時のいいね一覧を定義している
    @like_posts = Post.where(id: post_ids).page(params[:page]).per(9).order(created_at: :desc)
  end
end

