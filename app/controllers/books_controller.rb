class BooksController < ApplicationController
  def index
  	@books = Book.all
  	@book = Book.new
  end

  def show
  	@book = Book.find(params[:id])
  end

  def new
  	@book = Book.new
  	@books = Book.all
  end

  def create
  	book = Book.new(book_params)
  	if book.save
    flash[:notice] = "Book was successfully updated."
    redirect_to book_path(book.id)
    else
    @book = book
    @books = Book.all
    render :index
    end

  end
  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	book = Book.find(params[:id])
  	book.update(book_params)
  	if book.save
    flash[:notice] = "Book was successfully updated."
    redirect_to book_path(book.id)
    end

  end

  def destroy
  	book = Book.find(params[:id])
    if book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to books_path(@books)
    end
  end
  private
   def book_params
   	params.require(:book).permit(:title, :body)
   end

end
