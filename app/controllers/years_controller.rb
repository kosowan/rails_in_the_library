class YearsController < ApplicationController
  def index
    @years = Year.order("year DESC")
  end

  def show
    @year = Year.find(params[:id])
  end
end
