class GameChannel < ApplicationCable::Channel
  def subscribed
    @username = User.find(current_user.id).username
  end

  def unsubscribed; end

  def join(data)
    if game_id = data['game_id']
      stream_from "room#{game_id}"
      ActionCable.server.broadcast "room#{game_id}", newcommer:true if Board.find(game_id).guest != nil
    end
  end

  def leave_room(data)
    if game_id = data['game_id']
      board = Board.find(game_id)
      username = User.find(current_user.id).username
      board.host = board.guest if board.host == username
      board.guest = nil
      board.save
    end
  end

  def reset_game(data)
    game_id = data['game_id']
    board = Board.find(game_id)
    loser = which_letter(board)
    ActionCable.server.broadcast "room#{game_id}", resetGame:true, loser:loser
  end

  def make_move(data)
    game_id = data['game_id']
    board = Board.find(game_id)
    player_turn = which_letter(board)
    if player_turn == data['turn']
      ActionCable.server.broadcast "room#{data['game_id']}", move:data['move']
    end
  end

  private

  def which_letter(board)
    @username == board.host ? 'X' : 'O'
  end
end
