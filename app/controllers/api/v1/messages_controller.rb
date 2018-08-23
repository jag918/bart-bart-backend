class Api::V1::MessagesController < ApplicationController

  def show
    response = {'message':'FAILED'}
    @sender= User.find(params[:id])
    if @sender
      @messages= @sender.messages
      puts "______________________________"
      puts "PUTS", @message
      puts "______________________________"
      response = {'messages':@messages}
    end
    render json: response
  end

  def create
    response = {'message':'FAILED'}
    @message = Message.create(content: message_params[:content], sender_id: message_params[:user_id])
    if @message.valid?
      @message.save
      response = {'message':'SUCCESS'}
    end
    render json: response
  end

  private

  def message_params
    params.require(:message).permit(:content, :user_id)
  end


end
