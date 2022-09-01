class ApplicationController < ActionController::Base

  # check if a user is logged in on every page!
  before_action :fetch_user

  def fetch_user
    if session[:user_id].present?
      @current_user = User.find_by id: session[:user_id]
    end # login check

    # if there is no current user - clear the session user_id variable
    unless @current_user.present?
      session[:user_id] = nil
    end # check for a current user
  end # fetch_user

  def check_if_logged_in
    # redirect logged out users to login page

    unless @current_user.present?

      # flash a one-time message to give the user a hint
      flash[:error] = "You must login to perform that action"
      redirect_to login_path
    end #unless
  end # check_if_logged_in
end # class ApplicationController
