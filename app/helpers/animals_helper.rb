module AnimalsHelper
	def formatted_bred_date(animal)
		animal.date_bred.strftime("%b %d, %Y")
	end

	def formatted_due_date(animal)
		animal.estimated_due_date.strftime("%b %d, %Y")		
	end

end