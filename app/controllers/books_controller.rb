class BooksController < ApplicationController

  def new
  end

  def create
    # debugger
    # render plain: params[:book].inspect
    @book = Book.new(book_params)
    @book.save
    redirect_to @book
  end

  def destroy
  end

  def update
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  private

    def book_params
      params.require(:book).permit(:title, :text)
    end

end
