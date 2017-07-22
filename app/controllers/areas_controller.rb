class AreasController < ApplicationController

	def index
		@farm = Farm.find(params[:farm_id])
		@areas = @farm.areas	
	end
	
	def new
		@farm = Farm.find(params[:farm_id])
	end

	def create
		@area = Area.new(area_params)
		if @area.save
			redirect_to area_path(@area)
		else
			render :new
		end
	end

	def show
		@area = Area.find(params[:id])
	end


	private

	def area_params
		params.require(:area).permit(
			:name, 
			:area_type,
			:capacity, 
			:quantity,
			:farm_id,
			:_destroy
		)
	end
end