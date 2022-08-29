class UsersController < ApplicationController
  def new
    @user = User.new # for the 'form_with' form helper
  end # new

  def create
    @user = User.create user_params # strong params

    # did user creation succeed?
    if @user.persisted?
      session[:user_id] = @user.id # login
      redirect_to user_path(@user.id)
    else
      # by using the same variable as we expect in the new template
      # i.e. '@user'
      # the form populates the entered
      # data and adds 'div.field-with-errors'
      # where field requirements aren't met
      # re-render the new template 
      render :new
      
    end # if user create worked
    
  end # create

  def index
  end # index

  def show
  end # show

  def edit
  end # edit

  def update
  end # update

  def destroy
  end # destroy

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end # user_params
  
  
end # class UserController
