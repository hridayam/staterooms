class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    parameters = message_params
    parameters[:sender] = User.find(session[:user_id])
    parameters[:recipient] = User.where(email: parameters[:recipient]).first
    @message = Message.new(parameters)
    if @message.save
      flash[:success] = "Message successful!"
      redirect_to messages_path(@message.sender)
    else
      render :new
    end
  end

  def destroy
    @message = Message.find(deletion_param)
    if session[:user_id] == @message.recipient.id && Message.delete(deletion_param)
      flash[:success] = "Message deleted."
    end
    redirect_to messages_path(@message.sender)
  end

  private
    def message_params
      params.require(:message).permit(:sender, :recipient, :subject, :content)
    end

    def deletion_param
      params.require(:id)
    end
end
