class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @workshop = Workshop.find(params[:workshop_id])
  end

  def create
    @workshop = Workshop.find(params[:workshop_id])
    recipients = [current_user, User.find(@workshop.user_id)]
    conversation = current_user.send_message(recipients, conversation_params[:body], conversation_params[:subject]).conversation
    flash[:success] = "Your message was successfully sent!"
    redirect_to conversation_path(conversation)
  end

  def show
    @receipts = conversation.receipts_for(current_user)
    # mark conversation as read
    conversation.mark_as_read(current_user)
  end

  def reply
    current_user.reply_to_conversation(conversation, message_params[:body, :subject])
    flash[:notice] = "Your reply message was successfully sent!"
    redirect_to conversation_path(conversation)
  end

  def trash
    conversation.move_to_trash(current_user)
    redirect_to mailbox_inbox_path
  end

  def untrash
    conversation.untrash(current_user)
    redirect_to mailbox_inbox_path
  end

  private

  def conversation_params
    params.require(:conversation).permit(:subject, :body)
  end

  def message_params
    params.require(:message).permit(:body, :subject)
  end
end
