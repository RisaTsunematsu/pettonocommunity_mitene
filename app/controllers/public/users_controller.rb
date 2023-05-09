class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.where(is_deleted:false).page(params[:page]).per(10)
    
  end
  
  def show
   @user = User.find(params[:id])
   @posts = @user.posts.page(params[:page])
  end
  
  def edit
   is_matching_login_user
   @handlename = current_user.handlename
   @user = User.find(params[:id])
    #ゲストユーザーはマイページ編集をできなくした
    #編集ボタンを押した場合、ログアウトしホームへ
   if @user.email == 'guest@mail.com'
      reset_session
      redirect_to :root
   end
  end
 
  
  def update
    is_matching_login_user
    @user = User.find(params[:id])
    @handlename = current_user.handlename
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      @users = User.all
      render "edit"
    end
  end
  
  def unsubscribe
  end


  def withdrawal
   @user= current_user
   if @user.update(is_deleted: true)
    @user.comments.destroy_all()
    @user.likes.destroy_all()
    @user.posts.destroy_all()
    sign_out_and_redirect(current_user)
   else
    render "unsubscribe"
   end
  end
  
  
  private

  def user_params
    params.require(:user).permit(:handlename, :introduction, :profile_image,:is_deleted)
  end
  
 def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to posts_path
    end
 end

end
