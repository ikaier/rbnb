class PagesController < ApplicationController
  def home
    @lastest_cars = Car.order(id: :desc).limit(2)

    all_cars = Car.all
    categories = []
    @counts = Hash.new(0)
    all_cars.each do |car|
      categories << car.category
      categories.each { |name| @counts[name] += 1 }
    end
  end
end
