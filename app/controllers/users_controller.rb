class UsersController < ApplicationController
  def show
    @books = Book.all
    @user = User.find(params[:id])
    # @books = @user.books.page(params[:page]).reverse_order
    # ユーザーに関連付けられた投稿のみを渡す。。ページングのpageメソッド
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  
end 