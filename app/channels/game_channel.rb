class GameChannel < ApplicationCable::Channel
  def subscribed; end

  def unsubscribed; end

  def join(data)
    stop_all_streams
    stream_from "room#{data['game_id']}"
  end

  def leaveRoom
    stop_all_streams
  end

  def make_move(data)
    puts "****************************************"
    ActionCable.server.broadcast "room#{data['game_id']}", move:data['move']
  end
end
