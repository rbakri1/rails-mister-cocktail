class CocktailsController < ApplicationController

	def index
		@cocktails = Cocktail.all		
	end

	def show
		@cocktail = Cocktail.find(params[:id])
		@dose = Dose.new
		# CREATE A NEW DOSE INSTANCE IN ORDER TO FEED IT THROUGH TO THE SHOW VIEW SO A DOSE CAN BE ADDED ON THAT PAGE
	end

	def new
		@cocktail = Cocktail.new
	end

	def create
		@cocktail = Cocktail.new(cocktail_params)
		if @cocktail.save
		  redirect_to cocktail_path(@cocktail)
		else
		  render :new
		end
	end

	private

	def cocktail_params
		params.require(:cocktail).permit(:name, :photo, :photo_cache)
	end

end
