class BooksController < ApplicationController
  def index
    @books = Book.order("rating DESC").page(params[:page])


  end

  def show
    @book = Book.find(params[:id])
  end
  def search
    wildcard_search = "%#{params[:keywords]}%"

    @books = Book.where("title LIKE ?", wildcard_search)
  end
end
