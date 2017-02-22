class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  before_action :set_notindex
  
  def new
    @notindex=true
    @user = User.new
  end

  def create
   @notindex=true 
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to the SmogApp #{@user.username}"
      redirect_to user_path(@user)
    else
    render 'new'
    end
  end

  def index
    @notindex=true 
    @users = User.all
  end

  def show
     @posts = @user.posts.all.paginate(page: params[:page], per_page: 10)
  end


  def update
    if @user.update(user_params)
      flash[:success] = "Your account was updated successfully"
      redirect_to posts_path
    else
      render 'edit'
    end
  end  

  def edit    
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:danger] = "User and all articles created by user have been deleted"
    redirect_to users_path
  end
  
  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_notindex
    @notindex=true
  end
end

