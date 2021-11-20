class UsersController < ApplicationController
  def show
    @books = Book.all
    @user = User.find(params[:id])
    # @books = @user.books.page(params[:page]).reverse_order
  end
end
