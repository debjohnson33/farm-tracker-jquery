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
			flash[:notice] = "Farm was created."
			redirect_to farm_path(@farm)
		else
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
			flash[:notice] = "Farm was updated."
			redirect_to farm_path(@farm)
		else
			flash[:alert] = "Farm could not be updated."
			render :edit
		end
	end

	def destroy
		set_farm
		@areas = @farm.areas
		@areas.destroy
		@farm.destroy
		flash[:alert] = "Farm and areas were deleted."
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
			]
		)
	end

	def set_farm
		@farm = Farm.find(params[:id])
	end
end