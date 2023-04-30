class Public::HomesController < ApplicationController


def top
 @posts = Post.order(created_at: :desc).limit(9)
 @user = current_user
end


def about
end


end