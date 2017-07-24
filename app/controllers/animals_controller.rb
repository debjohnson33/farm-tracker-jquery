class AnimalsController < ApplicationController
	def index
		@farm = Farm.find(params[:farm_id])
		@animals = @farm.animals
	end

	def show
		@animal = Animal.find(params[:id])
	end

	def new
		@farm = Farm.find(params[:farm_id])
		@areas = @farm.areas.all
		@animal = Animal.new
		@animal.baby_animals.build
	end

	def create
		@farm = Farm.find(params[:farm_id])
		@animal = Animal.new(animal_params)
		if @animal.name != ''
			area = Area.find(params[:animal][:area_id])
			if area.quantity < area.capacity
				if params[:animal][:baby_animals_attributes][:name] != nil
					area.quantity += 2
				else
					area.quantity += 1
				end
				area.save
			end
		end

		if @animal.save
			redirect_to animal_path(@animal)
		else
			render :new
		end
	end

	def edit
		@animal = Animal.find(params[:id])
		@baby_animals = @animal.baby_animals
		@farm = @animal.area.farm
		@areas = @farm.areas
	end

	def update
		@animal = Animal.find(params[:id])
		@animal.update(animal_params)
		redirect_to animal_path(@animal)
	end

	def destroy
		@animal = Animal.find(params[:id])
		@animal.destroy
		redirect_to farm_path
	end


	private

	def animal_params
		params.require(:animal).permit(
			:id,
			:name,
			:area_id, 
			:age,
			:sex, 
			:color,
			:weight, 
			:animal_type,
			:pregnant,
			:date_bred,
			:estimated_due_date,
			:baby_animals_attributes => [
				:id,
				:name,
				:animal_id, 
				:age,
				:sex, 
				:color,
				:weight,
				:animal_type,
				:_destroy
			]

		)
	end
end