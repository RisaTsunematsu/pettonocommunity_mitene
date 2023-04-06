class Public::UsersController < ApplicationController
  def show
   @handlename = current_user.handlename
   @user = User.find(params[:id])
   @posts = @user.posts
   @post = Post.new
  end
  
  def edit
   @handlename = current_user.handlename
   @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @handlename = current_user.handlename
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      @users = User.all
      render "edit"
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
