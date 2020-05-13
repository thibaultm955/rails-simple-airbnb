class FlatsController < ApplicationController

    def index 
        @flats = Flat.all
    end

    def show
        @flat = Flat.find(params[:id])
    end

    def new
        @flat = Flat.new
    end

    def edit
        @flat = show
    end

    def update
        @flat = show
        @flat.update(flat_params)
        redirect_to flat_path(@flat)
    end

    def create
        @flat = Flat.new(flat_params)
        if @flat.save
            redirect_to flat_path(@flat)
        else
            render :new
        end
    end

    def destroy
        Flat.find(params[:id]).delete
        redirect_to "/flats"
    end

    private

    def flat_params
        params.require(:flat).permit(:name, :address, :description, :number_of_guests, :price_per_night)
    end
end
