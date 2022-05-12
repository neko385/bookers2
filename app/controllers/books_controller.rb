class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to '/home/about'
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end



end
