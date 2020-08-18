class CarsController < ApplicationController
  def index
    if params[:search].blank?
      redirect_to(root_path, alert: "Empty field!") and return
    else
      @cars = Cars.where()
    end
  end

  def show
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      redirect_to car_path(@car)
    else
      render :new
    end
  end

  def car_params
    params.require(:car).permit(:model, :description, :price, :category)
  end
end
