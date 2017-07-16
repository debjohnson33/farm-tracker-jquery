class FarmsController < ApplicationController
	def index
		@farms = Farm.all
	end

	def show
		@farm = Farm.find(params[:id])
		if @farm.areas.last.try(:name)
			@farm.areas.build
		end
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


	private

	def farm_params
		params.require(:farm).permit(
			:name, 
			:areas_attributes => [
				:id,
				:name, 
				:area_type,
				:capacity, 
				:quantity,
			]
		)
	end
end