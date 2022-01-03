class BooksController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  
  
  def new
    @book = Book.new
    # 「Book.new」と記述すると、空のモデルが生成され、インスタンス変数@bookに代入されてViewで利用できるようになる
  end

  def create
    # データを新規登録するインスタンス作成
    @book = Book.new(book_params)
    @books = Book.all
    @user = current_user
    @book.user_id = current_user.id
    # current_userはdeviseのヘルパーメソッドでログイン中のユーザー情報を取得できる
    if @book.save
     redirect_to book_path(@book.id), notice: "You have created book successfully."
    else
      render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user

  end

  def show
    @new_book = Book.new
    # URLが/books/1の場合、params[:id] と記述すると、id=1を取り出せます
    @book = Book.find(params[:id])
    @user = @book.user

  end

  def edit
    @book = Book.find(params[:id])
    @user = current_user
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
     redirect_to book_path(@book), notice: "You have updated book successfully."
    else
     render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice: "Book was successfully destroyed."

  end

 private
# ストロングパラメータ privateより下に書く事でアクションとして認識されず
# controllerの中でしか呼び出せない


# ここでフォームで入力されたデータを受け取っている
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end

end