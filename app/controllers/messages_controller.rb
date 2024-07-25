class MessagesController < ApplicationController
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
        group_name = @group.name
        @message = @group.messages.build(message_params)
        if @message.save
            redirect_to group_message_path(@group, @message), notice: "Successfully created message"

        else
            render :new
        end
    end

    private

    def message_params
        params.require(:message).permit(:content)
    end
end
