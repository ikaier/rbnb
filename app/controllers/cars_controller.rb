class CarsController < ApplicationController
  def index
    if params[:search].blank?
      redirect_to(root_path, alert: "Empty field!") and return
    else
      #@cars = Car.all.where(category:"van")
      @parameter = params[:search].downcase
      Car.reindex
      @cars= Car.search @parameter
      #@cars = Car.all.where("lower(category) LIKE :search OR lower(model) LIKE :search OR lower(description) LIKE :search", search: @parameter)

      @sets = Car.geocoded

      @markers = @sets.map do |car|
        {
          lat: car.latitude,
          lng: car.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { car: car })
        }
      end
    end
  end

  def show
    @car = Car.find(params[:id])

    @contract = Contract.new
    @contract.user=current_user
    @contract.car=@car
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
    params.require(:car).permit(:model, :description, :price, :category, :address, photos: [])
  end
end
