class AreasController < ApplicationController

	def index
		@farm = Farm.find(params[:farm_id])
		@areas = @farm.areas	
	end

	def new
		@farm = Farm.find(params[:farm_id])
		@area = Area.new
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

	def edit
		@area = Area.find(params[:id])
		@farm = Farm.find(@area.farm_id)
	end

	def update
		@area = Area.find(params[:id])
		@area.update(area_params)
		redirect_to area_path(@area)
	end

	def destroy
		@area = Area.find(params[:id])
		@farm = Farm.find(@area.farm_id)
		@area.destroy
		render farm_path(@farm)
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