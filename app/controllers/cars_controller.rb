class CarsController < ApplicationController
  def index
    if params[:search].blank?  
      redirect_to(root_path, alert: "Empty field!") and return  
    else
      @cars = Cars.where()
  end

  def show

  end

  def new
  
  end

  def create
    
  end

end
