class UsersController < ApplicationController
before_action :authenticate_user!

  def index
      @user = User.new
      @users = User.all
      @book = Book.new
  end

  def show
     @user = User.find(params[:id])
     @book = Book.new
     @books = @user.books
    # @books =Book.all
    # @books =Book.where(user_id: @user.id)
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(current_user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
