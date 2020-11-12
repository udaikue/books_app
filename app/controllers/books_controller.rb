# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :set_book, only: %I[show edit update destroy]

  def index
    @books = Book.page(params[:page]).per(10)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to @book, notice: t('notice.new')
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: t('notice.edit')
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_url, notice: t('notice.destroy')
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :memo, :author, :picture)
  end
end
