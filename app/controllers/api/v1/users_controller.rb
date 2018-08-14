class Api::V1::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
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

  private

  def user_params
    params.require(:user).permit(:name, :email, :password_digest)
  end

end
