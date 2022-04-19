class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[index edit update destroy]
  before_action :correct_user, only: %i[edit update]

  def index
    @users = User.page(params[:page])
  end

  def show
    @user = User.find_by!(id: params[:id])
    @microposts = @user.microposts.page(params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = 'Please check your email to activate your account!'
      redirect_to root_url
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:success] = 'Update profile successfully!'
      redirect_to @user
    else
      render(:edit)
    end
  end

  def destroy
    user = User.find_by!(id: params[:id])
    if user&.destroy
      flash[:success] = "User deleted"
    else
      flash[:danger] = "Delete fail!"
    end
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def logged_in_user
      return if logged_in?

      store_location
      flash[:danger] = 'Please log in.'
      redirect_to login_url
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end