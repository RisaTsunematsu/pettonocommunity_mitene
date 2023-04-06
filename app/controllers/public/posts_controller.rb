class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def show
    @newpost = Post.new
    @post = Post.find(params[:id])
    @user = @post.user
    #@comment = PostComment.new
    
  end

  def index
    @posts = Post.all
    @user = current_user
    @post = Post.new
   
  end

def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
  if 
      @post.save
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
  
  def destroy
    @post = Post.find(params[:id])  # データ（レコード）を1件取得
    @post.destroy # データ（レコード）を削除
    redirect_to posts_path  # 投稿一覧画面へリダイレクト  
  end

  #def destroy
    #@book = Book.find(params[:id])
    #@book.delete
    #redirect_to books_path
  #end

  private

  def post_params
    params.require(:post).permit(:title,:tag,:body,:post_image)
  end
  
end
