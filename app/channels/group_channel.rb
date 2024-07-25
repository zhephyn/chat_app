class GroupChannel < ApplicationCable::Channel
  def subscribed
     #stream_from "group_#{params[:group_name]}"
  end

  def unsubscribed
  end
end
