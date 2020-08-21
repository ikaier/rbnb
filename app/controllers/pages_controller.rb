class PagesController < ApplicationController
  def home
    @lastest_cars = Car.order(id: :desc)

    @all_cars = Car.all
    categories = []
    @counts = Hash.new(0)
    @all_cars.each do |car|
      categories << car.category
      categories.each { |name| @counts[name] += 1 }
    end

    @first_car = Car.find_by(category: @counts.keys[0])
    @second_car = Car.find_by(category: @counts.keys[1])
    @third_car = Car.find_by(category: @counts.keys[2])
    @fourth_car = Car.find_by(category: @counts.keys[3])
  end
end
