class AppearenceChannel < ApplicationCable::Channel
  def subscribed
    stream_from "appearence_channel"
    current_user.appear
  end

  def unsubscribed
    current_user.disappear
  end
end
