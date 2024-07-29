class UserChannel < ApplicationCable::Channel
  def subscribed
     stream_from "user_#{params[:user_email]}"
  end

  def unsubscribed
  end
end
