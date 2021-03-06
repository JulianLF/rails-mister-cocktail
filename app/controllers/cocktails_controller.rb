class CocktailsController < ApplicationController
  before_action :find_cocktail, only: %i[edit update show destroy]

  def index
    if params[:query] && params[:query].strip! != ''
      @cocktails = Cocktail.where("lower(name) LIKE '%#{params[:query].downcase}%'")
      @title = "matching with #{params[:query]}:"
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

  def edit; end

  def update
    @cocktail.update(cocktail_params)
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :description, :photo)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
