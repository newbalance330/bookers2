class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    # current_userはdeviseのヘルパーメソッドでログイン中のユーザー情報を取得できる
    @book.save
    redirect_to book_path(@book.id), notice: "You have created book successfully."
  end

  def index
    @books = Book.all

  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book), notice: "You have updated book successfully."
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice: "Book was successfully destroyed."

  end

 private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end