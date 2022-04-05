class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,only: [:edit, :update]
  def show
    @user = User.find_by!(id: params[:id])
  end

  def index
    @users = User.page(params[:page])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the sample app!"
      log_in(@user)
      redirect_to @user
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    if user&.destroy
      flash[:success] = "User deleted"
    else
      flash[:danger] = "Delete fail!"
    end
    redirect_to users_path
  end

  private

  def logged_in_user
    return if logged_in?

    store_location
    flash[:danger] = "Please log in."
    redirect_to login_url
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(user)
  end
private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
