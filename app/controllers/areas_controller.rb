class AreasController < ApplicationController
	before_action :set_area, except: %i[index new create]
	before_action :set_farm, except: %i[show edit update destroy]

	def index
		if current_user.id == @farm.user_id
			@areas = @farm.areas
			render :index
		else
			redirect_to farms_path
		end
	end

	def new
		@area = Area.new
	end

	def create
		@area = Area.new(area_params)
		if @area.save
			flash[:notice] = "Area was created."
			redirect_to area_path(@area)
		else
			render :new
		end
	end

	def show
	end

	def edit
		@farm = Farm.find(@area.farm_id)
	end

	def update
		if @area.update(area_params)
			flash[:notice] = "Area was updated."
			redirect_to area_path(@area)
		else
			@farm = Farm.find(@area.farm_id)
			render :edit
		end
	end

	def destroy
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