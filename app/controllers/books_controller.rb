class BooksController < ApplicationController
  def index
    @books = Book.order("rating DESC")
  end

  def show
    @book = Book.find(params[:id])
  end
end
