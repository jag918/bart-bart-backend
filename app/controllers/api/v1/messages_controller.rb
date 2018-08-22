class Api::V1::MessagesController < ApplicationController

  def index
    @messages=Message.all
    render json: @messages
  end

  def create
    @message=Message.create()
  end

end
