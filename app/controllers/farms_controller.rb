class FarmsController < ApplicationController
	def index
		@farms = Farm.all
	end

	def show
		set_farm
	end

	def new
		@farm = Farm.new
		@user = current_user
		@farm.areas.build
		@farm.areas.build
	end

	def create
		@farm = Farm.new(farm_params)
		if @farm.save
			redirect_to farm_path(@farm)
		else
			flash[:alert] = "Farm not created. Fill in all fields."
			render :new
		end
	end

	def edit
		set_farm
		if @farm.areas.count < 1
			@farm.areas.build
		end
	end

	def update
		set_farm
		if @farm.update(farm_params)
			redirect_to farm_path(@farm)
		else
			flash[:alert] = "Farm could not be updated"
			render :edit
		end
	end

	def destroy
		set_farm
		@areas = @farm.areas
		@areas.destroy
		@farm.destroy
		redirect_to farms_path
	end


	private

	def farm_params
		params.require(:farm).permit(
			:name,
			:user_id, 
			:areas_attributes => [
				:id,
				:name, 
				:area_type,
				:capacity, 
				:quantity,
				:farm_id,
				:_destroy
			]
		)
	end

	def set_farm
		@farm = Farm.find(params[:id])
	end
end