class MessagesController < ApplicationController

  def index
    @message = Message.new
    render :layout => "inquiry"
  end
 
  def confirm
    @message = Message.new(message_params)
    if @message.valid?
      render :layout => "inquiry", :action => 'confirm'
    else
      render :layout => "inquiry", :action => 'confirm'
    end
  end
 
  def done
    @message = Message.new(message_params)
    if params[:back]
      render :layout => "inquiry", :action => 'index'
    else
      MessageMailer.received_email(@message).deliver_now
      render :layout => "inquiry", :action => 'done'
    end
  end
  
  private
  def message_params
    params.require(:message).permit(:name, :email, :content)
  end
  
end
