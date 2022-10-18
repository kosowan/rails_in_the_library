class HomeController < ApplicationController
  def index
    @books = Book.order("rating DESC").limit(250)

    @years = Year.order("year DESC")

    @authors = Author.order("name ASC")

    @genres = Genre.order("name ASC")
  end
end
