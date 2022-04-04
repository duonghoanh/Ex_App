class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user&.authenticate(params[:session][:password])
      log_in(@user)
      remember_me? ? remember(@user) : forget(@user)
      flash[:success] = 'Login successfully!'
      redirect_to user_path(@user)
    else
      flash.now[:danger] = 'Email/Password invalid!'
      render :new
    end
  end

  def destroy
    log_out
    flash[:success] = 'Log out successfully!'
    # redirect_to login_path
    redirect_to login_path
  end

  private

  def remember_me?
    params[:session][:remember_me] == "1"
  end
end
