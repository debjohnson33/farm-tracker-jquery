class AreasController < ApplicationController

	def index
		set_farm
		@areas = @farm.areas	
	end

	def new
		set_farm
		@area = Area.new
	end

	def create
		set_farm
		@area = Area.new(area_params)
		if @area.save
			flash[:notice] = "Area was created."
			redirect_to area_path(@area)
		else
			render :new
		end
	end

	def show
		set_area
	end

	def edit
		set_area
		@farm = Farm.find(@area.farm_id)
	end

	def update
		set_area
		if @area.update(area_params)
			flash[:notice] = "Area was updated."
			redirect_to area_path(@area)
		else
			@farm = Farm.find(@area.farm_id)
			render :edit
		end
	end

	def destroy
		set_area
		@area.destroy
		flash[:notice] = "Area was deleted."
		redirect_to farms_path
	end


	private

	def area_params
		params.require(:area).permit(
			:name, 
			:area_type,
			:capacity, 
			:quantity,
			:farm_id,
		)
	end

	def set_farm
		@farm = Farm.find(params[:farm_id])
	end

	def set_area
		@area = Area.find(params[:id])
	end
end