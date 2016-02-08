class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  before_action :check_user, only: [:edit,:update,:followings,:followers]
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "プロフィールを編集しました"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def followings
    @user = User.find(params[:user_id])
    @users = @user.following_users
  end
  
  def followers
    @user = User.find(params[:user_id])
    @users = @user.follower_users
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile, :location)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def check_user
    if current_user != @user
      redirect_to login_path
    end
  end
  
end
