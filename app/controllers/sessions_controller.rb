class SessionsController < ApplicationController
  def new_login
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user&.authenticate(params[:session][:password])
      log_in(user)
       flash[:success] = 'Congturation login !!!'
      redirect_to(user)
    else
      flash.now[:danger] = "Invalid email/password combination"
      render :new_login
    end
  end
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end
  def destroy
    log_out
    redirect_to root_url
  end


end
