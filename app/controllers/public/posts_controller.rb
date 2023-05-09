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
    @comments = Comment.page(params[:page])
  end

  def index
    @posts = Post.page(params[:page]).per(9).order(created_at: :desc) #order(created_at: :desc):投稿を新しい順に並べる
    @user = current_user
    @post = Post.new
    @tags = params[:tag_ids]
    
    if params[:tag_ids]
      @posts = []
      params[:tag_ids].each do |key, value|      
        @posts += Tag.find_by(name: key).posts if value == "1"
      end
      @posts.uniq!
      @posts = Post.where(id: @posts).page(params[:page]).order(created_at: :desc)
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
  
    if@post.save
      redirect_to post_path(@post.id), notice: "You have created book successfully."
    else
      @posts = Post.page(params[:page]).per(9)
      @user = current_user
      render :index
    end
  end

  def edit
   @post = Post.find(params[:id])
   #ログインユーザー以外が直接urlを打ったら投稿一覧へ飛ぶ
   if @post.user == current_user
    render "edit"
   else
    redirect_to posts_path
   end
  end

  def update
    @post = Post.find(params[:id])
    if @post.user == current_user
     render "edit"
    else
     redirect_to posts_path
    end
    if @post.update(post_params)
       redirect_to post_path(@post.id), notice: "You have updated book successfully."
    else
       @posts = Post.all
       render :edit
    end
  end
  
  def search
    if params[:keyword].present?
      @posts = Post.where('tag LIKE ?',"%#{params[:keyword]}%").order(created_at: :desc)
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
  
  def like_posts
    @user = User.find(params[:user_id])
    post_ids = @user.likes.pluck(:post_id)
    # post_ids = Like.where(user_id: params[:user_id]).pluck(:post_id) #全部のいいねからuser_idカラムの値がparams[:user_id]のlikeをwhereで絞り込む
    @like_posts = Post.where(id: post_ids).page(params[:page]).per(9).order(created_at: :desc)
  end
  
  private

  def post_params
    params.require(:post).permit(:title,:tag,:body,:post_image,tag_ids: [])
  end
  
end
