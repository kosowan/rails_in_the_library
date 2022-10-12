class HomeController < ApplicationController
  def index
    @books = Book.order("rating DESC").limit(50)
  end
end
