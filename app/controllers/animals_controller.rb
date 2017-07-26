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
				area.quantity += 1
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
		if @animal.baby_animals.count > 0
			@baby_animals = @animal.baby_animals
		else
			@animal.baby_animals.build
		end
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
			:estimated_due_date
		)
	end
end