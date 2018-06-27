class GameChannel < ApplicationCable::Channel
  def subscribed; end

  def unsubscribed; end

  def join(data)
    stop_all_streams
    puts data['game_id']
    game_id = data['game_id']
    puts game_id
    if game_id
      stream_from "room#{game_id}"
      ActionCable.server.broadcast "room#{game_id}", newcommer:true if Board.find(game_id).guest != nil
    end
  end

  def leaveRoom
    stop_all_streams
  end

  def make_move(data)
    ActionCable.server.broadcast "room#{data['game_id']}", move:data['move']
  end
end
