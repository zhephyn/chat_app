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
        @group = Group.find(params[:group_id])
        @message = @group.messages.build(message_params)
        if @message.save
            ActionCable.server.broadcast("group_#{@group.name}", {message: @message.content, group: @message.group.name})
            #redirect_to group_path(@group), notice: "Successfully created message"
        else
            render :new
        end
    end

    private

    def message_params
        params.require(:message).permit(:content)
    end
end
