class DestinationsController < ApplicationController

    def show 
        @destination = Destination.all.find(params[:id])
    end
end