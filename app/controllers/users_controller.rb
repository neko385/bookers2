class UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    @user == current_user
    if user.update(user_params)
      flash[:notice] ="You have updated user successfully."
      redirect_to user_path(user.id)
    else
      flash.now[:alert] = "error"
      render :edit_user_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
