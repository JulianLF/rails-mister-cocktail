class DosesController < ApplicationController
  before_action :find_dose, only: %i[destroy]

  def create
    cocktail = Cocktail.find(params[:cocktail_id])
    dose = Dose.new(dose_params)
    dose.cocktail = cocktail
    dose.save
    redirect_to cocktail_path(cocktail)
  end

  def destroy
    cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end

  def find_dose
    @dose = Dose.find(params[:id])
  end
end
