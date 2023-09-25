class UsersController < ApplicationController
     before_action :is_matching_login_user, only: [:edit, :update]

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
    @books = Book.all
  end


  def show
    @user = User.find(params[:id])
    @books = Book.where(user_id: @user.id)
    @book = Book.new
  end
  
  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = 'Profile update successfully'
      redirect_to user_path(@user)
    else
      @user = current_user
      flash.now[:notice] = "Profile was not successfully update."
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user)
    end
  end

end