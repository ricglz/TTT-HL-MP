class GameChannel < ApplicationCable::Channel
  def subscribed
    @username = current_user.username
  end

  def unsubscribed; end

  def join(data)
    if game_id = data['game_id']
      stream_from "room#{game_id}"
      GameJob.perform_now(game_id)
    end
  end

  def leave_room(data)
    stop_all_streams
    if game_id = data['game_id']
      board = Board.find(game_id)
      username = User.find(current_user.id).username
      board.host = board.guest if board.host == username
      board.guest = nil
      board.save
      ActionCable.server.broadcast "room#{game_id}", leaveRoom:true
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
