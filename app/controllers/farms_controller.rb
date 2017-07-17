class FarmsController < ApplicationController
	def index
		@farms = Farm.all
	end

	def show
		@farm = Farm.find(params[:id])
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
			render :new
		end
	end

	def edit
		set_farm		
	end

	def update
		set_farm
		@farm.update(farm_params)
		redirect_to farm_path(@farm)
	end


	private

	def farm_params
		params.require(:farm).permit(
			:name,
			:user_id, 
			:areas_attributes => [
				:name, 
				:area_type,
				:capacity, 
				:quantity,
			]
		)
	end

	def set_farm
		@farm = Farm.find_by(params[:id])
	end
end