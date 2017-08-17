class RidesController < ApplicationController

  def ride
    @attraction = Attraction.find(params[:id])
    @user = User.find(session[:user_id])
    @ride = Ride.create(attraction_id: @attraction.id, user_id: @user.id)
    flash[:message] = @ride.take_ride
    redirect_to user_path(@user)
  end

end