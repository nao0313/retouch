class MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to fix_path(@message.fix)
    else
      @fixes = @message.fix
      @messages = @fixes.messages
      render "fixes/show"
    end
  end

  def destroy
    @message = Message.find(params[:fix_id])
    redirect_to "fixes/show" if @message.destroy
  end

  private

  def message_params
    params.require(:message).permit(:comment, :avatar).merge(user_id: current_user.id, fix_id: params[:fix_id])
  end
end
