class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    parameters = message_params
    parameters[:sender] = User.find(session[:user_id])
    parameters[:recipient] = User.where(email: parameters[:recipient]).first!
    @message = Message.new(parameters)
    if @message.save
      flash[:sucess] = "Message successful!"
      redirect_to messages_path(@message.sender)
    else
      render :new
    end
  end

  private
    def message_params
      params.require(:message).permit(:sender, :recipient, :subject, :content)
    end
end
