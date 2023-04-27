class Public::HomesController < ApplicationController


def top
 @posts = Post.page(params[:page]).per(30).order(created_at: :desc)
end


def about
end


end