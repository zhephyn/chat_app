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
        @message.user_id = current_user.id
        if @message.save
            if @message.group
                ActionCable.server.broadcast("group_#{@message.group.name}", {message: @message.content, group: @message.group})
            else
                ActionCable.server.broadcast("user_#{@message.recipient.email}", {message: @message.content, recipient: @message.recipient})
            end
        else
            render :new
        end
    end

    private

    def message_params
        params.require(:message).permit(:content, :group_id, :recipient_id)
    end
end
