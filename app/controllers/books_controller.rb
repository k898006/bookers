class BooksController < ApplicationController

   def index
    @books = Book.all
    @book = Book.new
   end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Operation was successfully completed"
      redirect_to book_path(@book.id)
    else render :new
    end
  end



  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Operation was successfully completed"
      redirect_to book_path(@book.id)
    else render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Operation was successfully completed"
    redirect_to '/books'
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
