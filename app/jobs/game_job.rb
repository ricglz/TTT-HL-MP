class GameJob < ApplicationJob
  queue_as :default

  def perform(game_id)
    ActionCable.server.broadcast "room#{game_id}", newcommer:true if Board.find(game_id).guest != nil
  end
end
