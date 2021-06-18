class ChatroomController < ApplicationController

  before_action :authenticate_user!

  def index
    @real_estate = find_real_estate
    @investors  = find_investors(@real_estate)
    @messages = find_investors_messages(@real_estate)
  end

  def create 
    @message = current_user.messages.build(message_params)
    if @message.save
      puts "OK"
      redirect_to real_estate_chatroom_index_path(params[:real_estate_id])
    else
      puts @message.errors.messages
      render :index
    end
  end
  
  private
  def message_params
    params.require(:message).permit(:body)
  end

  def find_real_estate
    return RealEstate.find(params[:real_estate_id])
  end
  
end