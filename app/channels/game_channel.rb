class GameChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def make_move(data)
    puts "****************************************"
    puts data['move']
    ActionCable.server.broadcast "room", move:data['move']
  end
end
