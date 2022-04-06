class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user&.authenticate(params[:session][:password])
      if @user.activated?
        log_in(@user)
        remember_me? ? remember(@user) : forget(@user)
        flash[:success] = 'Login successfully!'
        redirect_back_or(user_path(@user))
      else
        message = 'Account not activated. '
        message += 'Check your email for the activation link.'
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'Email/Password invalid!'
      render :new
    end
  end


  def destroy
    log_out
    flash[:success] = 'Log out successfully!'
    redirect_to login_path
  end

  private

    def remember_me?
      params[:session][:remember_me] == '1'
    end
end