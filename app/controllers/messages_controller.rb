class MessagesController < ApplicationController
    before_action :authenticate_user!
    def index
        @messages = Message.all
    end

    def show
        @message = Message.find(params[:id])
    end

    def new
        @message = Message.new
    end

    def create
        @message = current_user.sent_messages.build(message_params)
        @message.save
        if @message.group
            ActionCable.server.broadcast("group_#{@message.group.name}", {message: @message.content, group: @message.group})
        else
            ActionCable.server.broadcast("user_#{@message.receiver.id}", {message: @message.content, recipient: @message.reciever})
        end
    end

    private

    def message_params
        params.require(:message).permit(:content, :group_id, :recipient_id)
    end
end
