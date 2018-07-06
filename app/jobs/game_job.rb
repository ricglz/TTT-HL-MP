# frozen_string_literal: true

# Class that carries the jobs from game channel
class GameJob < ApplicationJob
  queue_as :default

  def perform(game_id)
    broadcast(game_id) unless waiting?
  end

  private

  def waiting?
    Board.find(game_id).guest.nil?
  end

  def broadcast(game_id)
    ActionCable.server.broadcast("room#{game_id}", newcommer: true)
  end
end
