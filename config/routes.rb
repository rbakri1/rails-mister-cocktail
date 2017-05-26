Rails.application.routes.draw do

	resources :cocktails, except: [ :edit, :update, :destroy ] do
    	resources :doses, only: [ :new, :create]
  	end

  	resources :doses, only: [:destroy]
  	# DON'T NEED DESTROY METHOD NESTED WITHIN COCKTAILS BECAUSE YOU DON'T NEED THE COCKTAIL ID IN ORDER TO DELETE THE CORRECT DOSE!
  	# IT'S GOOD PRACTICE TO KEEP YOUR URLS AS SHORT AS POSSIBLE (I.E. NOT HAVE NEEDLESS THINGS E.G. MODELS AND IDS IN IT)
  	root "cocktails#index"
  	# NEED TO SET THE ROOT PATH IN ORDER TO 1. UPLOAD TO HEROKU 2. HAVE A BETTER USER EXPERIENCE!

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
