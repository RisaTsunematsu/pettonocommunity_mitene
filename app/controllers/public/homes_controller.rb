class Public::HomesController < ApplicationController


def top
 @posts = Post.page(params[:page]).per(30)
end


def about
end


end