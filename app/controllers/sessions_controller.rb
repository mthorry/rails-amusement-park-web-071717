class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    # if params[:user][:name] == ""
    #   redirect_to '/login'
    # params[:user][:name]
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    # else
    #   redirect_to '/login'
    # end
  end


  def destroy
    session.delete :user_id
    redirect_to '/'
  end
end