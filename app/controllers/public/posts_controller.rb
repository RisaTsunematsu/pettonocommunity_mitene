class Public::PostsController < ApplicationController
  before_action :authenticate_user!, only: %i(new show create edit update destroy)
  
  def new
    @post = Post.new
  end

  def show
    @newpost = Post.new
    @post = Post.find(params[:id])
    @user = @post.user
    @comment = Comment.new
  end

  def index
    @posts = Post.all
    @user = current_user
    @post = Post.new
    
    if params[:tag_ids]
      @posts = []
      params[:tag_ids].each do |key, value|      
        @posts += Tag.find_by(name: key).posts if value == "1"
      end
      @posts.uniq!
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
  
    if@post.save
      redirect_to post_path(@post.id), notice: "You have created book successfully."
    else
      @posts = Post.all
      @user = current_user
      render :index
    end
  end

  def edit
   @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if@post.update(post_params)
      redirect_to post_path(@post.id), notice: "You have updated book successfully."
    else
      @posts = Post.all
      render :edit
    end
  end
  
  def search
    if params[:keyword].present?
      @posts = Post.where('tag LIKE ?',"%#{params[:keyword]}%")
      @keyword = params[:keyword]
    else
      @posts = Post.all
    end
  end
  
  def destroy
    @post = Post.find(params[:id])  # データ（レコード）を1件取得
    @post.destroy # データ（レコード）を削除
    redirect_to posts_path  # 投稿一覧画面へリダイレクト  
  end
  
  private

  def post_params
    params.require(:post).permit(:title,:tag,:body,:post_image,tag_ids: [])
  end
  
end
