class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
    @user = User.find(session[:user_id])
  end

  def show
    @user = User.find(session[:user_id])
    @attraction = Attraction.find(params[:id])
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(att_params(:name, :nausea_rating, :tickets, :happiness_rating, :min_height))
    @attraction.save
    redirect_to attraction_path(@attraction)
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
     @attraction = Attraction.find(params[:id])
    @attraction.update(att_params(:name, :nausea_rating, :tickets, :happiness_rating, :min_height))
    redirect_to attraction_path(@attraction)
  end


  private

  def att_params(*args)
    params.require(:attraction).permit(*args)
  end


end
