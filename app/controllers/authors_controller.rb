class AuthorsController < ApplicationController
  def index
    @authors = Author.all.order("name ASC").page(params[:page])
  end

  def show
    @author = Author.find(params[:id])
  end
end
