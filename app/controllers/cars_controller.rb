class CarsController < ApplicationController
  def index
    if params[:search].blank?
      redirect_to(root_path, alert: "Empty field!") and return
    else
      #@cars = Car.all.where(category:"van")
      @parameter = params[:search].downcase  
      @cars = Car.all.where("lower(category) LIKE :search", search: @parameter)  
    end
  end

  def show
    @car = Car.find(params[:id])
  end

#  def descending_help
 #   respond_to do |format|
 #     format.html {}
 #     format.js
 #   end
#  end

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

 def book
  @car = Car.find(params[:id])
  @contract = Contract.new
  @contract.user=current_user
  @contract.car=@car

end

  def car_params
    params.require(:car).permit(:model, :description, :price, :category, photos: [])
  end
end
