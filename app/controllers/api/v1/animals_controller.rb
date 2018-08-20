class Api::V1::AnimalsController < ApplicationController

  def index
    @animals = Animal.all
    render json: @animals
  end

  def show
    user_id = params[:user_id].to_i
    @animal=find_animal
    animal_favorited = nil
    if(user_id)
      animal_favorited = Favorite.all.find { |favorite|
        favorite.animal_favorite_id == params[:id].to_i && favorite.seeker_id == user_id
    }
    else
      animal_favorited = nil
    end
    response = {"animal":@animal, "animal_favorited": animal_favorited != nil}
    render json: response
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
