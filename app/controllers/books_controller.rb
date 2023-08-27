class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  def new
    @user = current_user
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @user = current_user
    @book.user = current_user
    if @book.save
     flash[:notice] = 'You have created book successfully.'
     redirect_to book_path(@book)
    else
     @books = Book.all
     render :index
    end
  end

  def index
    @user = current_user
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = current_user
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
     redirect_to @book, notice: 'You have updated book successfully.'
    else
      render :edit
    end
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
    def is_matching_login_user
    user = User.find(params[:id])
     unless user.id == current_user.id
      redirect_to books_path
     end
    end
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
