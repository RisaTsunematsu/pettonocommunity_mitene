class Public::HomesController < ApplicationController


def top
 @posts = Post.page(params[:page]).per(9).order(created_at: :desc)
 @user = current_user
end


def about
end


end