class DosesController < ApplicationController

	before_action :set_cocktail, only: [:new, :create, :destroy]
	# THIS RUNS THE SET_COCKTAIL ACTION BEFORE THE NEW, CREATE, AND DESTROY ACTIONS.
	# NOTE THAT IF WE RAN THE E.G. EDIT ACTION, THEN THIS ACTION WOULDN'T HAPPEN FIRST AS WE SAID ONLY TO RUN BEFORE 3 OF THEM

	def new
		@dose = Dose.new
	end

	def create
		@dose = Dose.new(dose_params)
		@dose.cocktail = @cocktail
		if @dose.save
		  redirect_to cocktail_path(@cocktail)
		else
		  render :new
		end
	end

	def destroy
		@dose = Dose.find(params[:id])
		@dose.cocktail = @cocktail
		@dose.destroy
		redirect_to cocktail_path(@cocktail)
	end

	private

	def set_cocktail
	  @cocktail = Cocktail.find(params[:cocktail_id])
	end

	def dose_params
	  params.require(:dose).permit(:description, :ingredient_id)
	end


end