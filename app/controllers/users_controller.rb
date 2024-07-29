class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @message = Message.new
    @sent_messages = current_user.sent_messages.where(recipient_id: @user.id)
    @received_messages = current_user.received_messages.where(sender_id: @user.id)
    @chat_history = Message.where(sender_id: [current_user.id, @user.id], recipient_id: [current_user.id, @user.id]).order(:created_at)
  end
end
