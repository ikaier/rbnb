class ContractsController < ApplicationController
    def new
        @contract=Contract.new
    end

    def create
      @contract = Contract.new
      @contract.user=current_user
      @car = Car.find(params[:id])
      @contract.car=@car

      redirect_to car_path(@car)
    end

      def success
      end
end
