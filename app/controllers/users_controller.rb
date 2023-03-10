class UsersController < ApplicationController

  def index
    @book = Book.new
    @users = User.all
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    # user_params
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    # URLからの入力による不正ページ表示を防ぐ
    if @user.id != current_user.id
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
     if @user.update(user_params)
       redirect_to user_path
       flash[:notice] = "You have updated user successfully."
     else
       render :edit
     end
  end



  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
