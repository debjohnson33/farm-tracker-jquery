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
		@farm = Farm.find(params[:farm_id])
		@area = Area.new(area_params)
		if @area.save
			flash[:notice] = "Area was created."
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
		flash[:notice] = "Area was updated."
		redirect_to area_path(@area)
	end

	def destroy
		@area = Area.find(params[:id])
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
end