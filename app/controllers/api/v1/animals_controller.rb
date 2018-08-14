class Api::V1::AnimalsController < ApplicationController

  def index
    @animals = Animal.all
    render json: @animals
  end

  def show
    @animal=find_animal
    render json: @animal
  end

  def create
    @animal = Animal.new(animal_params)
    if @animal.valid?
      @animal.save
    end
  end

  private

  def find_animal
   @animal = Animal.find(params[:id])
  end

  def animal_params
    params.require(:animal).permit(:name, :breed, :description, :image, :user_id)
  end

end
