class UsersController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    # current_userはdeviseのヘルパーメソッドでログイン中のユーザー情報を取得できる
    @book.save
    redirect_to books_path
  end

  def index
    @users = User.all
    @user = current_user
    @new_book = Book.new
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books.all
  end

  def edit
    @user = User.find(params[:id])

  end

  def update
   @user = User.find(params[:id])
   @user.update(user_params)
   redirect_to user_path(@user.id), notice: "You have updated user successfully."

  end

 private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end