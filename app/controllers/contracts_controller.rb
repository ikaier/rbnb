class ContractsController < ApplicationController
    def new
        @contract=Contract.new
    end

    def create
        @contract=Contract.new()
        @contract.user=User.find(params[:user])
        @contract.car=Car.find(params[:car])
        if @contract.save
          redirect_to success_path
        else
         render :new
        end
      end

      def success
      end
end
