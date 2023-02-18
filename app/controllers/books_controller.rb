class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  # 本投稿フォームに入力されたデータを保存するアクション
  def create
    @book = Book.new(books_params)
    # 受取った1レコードのuser_idと現在のユーザーを結ぶ
    @book.user_id = current_user.id
    if @book.save
    # 詳細や編集ページに飛ぶときは引数で:idを指定する必要がある！
      redirect_to book_path(@book.id)
      flash[:notice] = "You have created book successfully."
    else
      @user = User.find(params[:id])
      @books = Book.all
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    # @user = @books.user_id
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    # ここの.userはモデルを表す
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(books_params)
      redirect_to book_path(@book.id)
      flash[:notice] = "You have updated book successfully."
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def books_params
    params.require(:book).permit(:title, :body)
  end

end
