class BooksController < ApplicationController
#before_action :is_matching_login_user, only: [:edit, :update]

  def new
    @book = Book.new
  end


  # 投稿データの保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to books_path
    else
      render :new
    end
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
  @book = Book.find(params[:id])
    if @book.user == current_user
      render"edit"
    else
      redirect_to books_path
    end
  end

  

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to books_path
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end



  # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title,:body,)
  end

  # defis_matching_login_user
  # #user_id = params[:id].to_i
  #   @book = Book.find(params[:id])
  #   if@book.user == current_user
  #     render"edit"
  #   else
  #     redirect_to books_path
  #   end
  # end

end