class CocktailsController < ApplicationController
  before_action :find_cocktail, only: %i[show destroy]

  def index
    if params[:query] && params[:query].strip != ''
      @cocktails = Cocktail.where("name LIKE '%#{params[:query]}%'")
      @title = "matching with : #{params[:query]}"
    else
      @cocktails = Cocktail.all
      @title = ''
    end
  end

  def show
    @dose = Dose.new
    @review = Review.new
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

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :description, :image)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
