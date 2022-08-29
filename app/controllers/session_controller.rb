class SessionController < ApplicationController
  def new
  end

  def create
    # raise 'hell'

    # 1. check email address is in the db
    user = User.find_by email: params[:email]

    # 2. email exists? check password.
    if user.present? && user.authenticate( params[:password] )
      # successful login
      # session - a hash stored in a cookie
      session[:user_id] = user.id # login
      redirect_to root_path
    else
      # bad login - unknown email or wrong password
      flash[:error] = 'Invalid email address or password'
      redirect_to login_path  # Try again! - Show error message

    end # if

  end # create

  def destroy
    session[:user_id] = nil  # logs out the user
    redirect_to login_path    # return user to login screen
  end
end
