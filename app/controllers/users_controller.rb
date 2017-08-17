class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params(:name, :password, :tickets, :height, :admin, :nausea, :happiness))
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    logged_in?
  end

  private

  def user_params(*args)
    params.require(:user).permit(*args)
  end

  def logged_in?
    if session[:user_id] != @user.id
     redirect_to '/'
    end
  end

  def admin?
    !!self.admin
  end

end
