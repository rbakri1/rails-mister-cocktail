class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :description, presence: true
  validates_uniqueness_of :cocktail_id, scope: :ingredient_id
  # THIS ENSURES THAT THE COCKTAIL AND INGREDIENT PAIR ARE UNIQUE
end
