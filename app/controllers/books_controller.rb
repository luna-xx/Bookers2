class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
    @book = Book.all
  end

  def show
  end

  def edit
  end
end
