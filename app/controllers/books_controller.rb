class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(books_params)
    @book.save
    redirect_to book_path
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
    book = Book.find(params[:id])
    book.update(books_params)
    redirect_to book_path(book.id)
  end

  def destroy
  end

  private
  def books_params
    params.require(:book).permit(:title, :body)
end
