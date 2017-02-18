class UsersController < ApplicationController

  def new
  @notindex=true
    @user = User.new
  end

  def create
   @notindex=true 
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the SmogApp #{@user.username}"
    redirect_to posts_path
    else
    render 'new'
    end
  end

  def index
       @notindex=true 

    @users = User.all

  end

  def show
       @notindex=true 

    @user = User.find(params[:id])
  end
  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end

