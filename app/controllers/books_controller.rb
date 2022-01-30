class BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user_id != current_user.id
      redirect_to book_path(@book.id)
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book)
    else
      render :index
    end
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      render :edit
    end
  end
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
