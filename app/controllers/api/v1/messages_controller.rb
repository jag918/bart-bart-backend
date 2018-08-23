class Api::V1::MessagesController < ApplicationController

  def show
    response = {'message':'FAILED'}
    @sender= User.find(params[:id]).to_i
    if @sender
      @messages= @sender.messages
      puts "______________________________"
      puts "PUTS", @message
      puts "______________________________"
      response = {'messages':@messages}
    end
    render json: response
  end

end
