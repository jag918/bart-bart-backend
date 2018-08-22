class Api::V1::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @favorites = @user.animal_favorites
    response = {'user':@user, 'favorites':@favorites}
    render json: response
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      response = {'message':'SUCCESS'}
    else
      response = {'message':'FAILED'}
    end
    render json: response
  end

  def signin
    @user = User.find_by(name: user_params[:name])
    if @user
      render json: @user
    end
    # byebug
  end

  def favorite
    response = {'message':'FAILED'}
    @user = User.find(params[:user_id])
    if @user
      @animal = Animal.find(params[:animal_id])
      @favorite= Favorite.create(seeker_id:@user[:id], animal_favorite_id:@animal[:id])
      response = {'message':'SUCCESS'}
    end
    render json: response
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password_digest)
  end

end
