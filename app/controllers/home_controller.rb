class HomeController < ApplicationController
  def index
    @books = Book.order("rating DESC").limit(50)

    @years = Year.order("year DESC")
  end
end
