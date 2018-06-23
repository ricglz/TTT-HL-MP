class BoardsController < ApplicationController
  def show
    redirect_to log_in_path unless logged_in?
    @board = Board.find(params[:id])
    if @board.nil?
      redirect_to root_path
    end
  end

  def create
    @board = Board.new(host: current_user.username)
    @board.save
    redirect_to game_path(@board.id)
  end

  def index
    redirect_to log_in_path unless logged_in?
    @boards = Board.where(guest: nil)
  end
end
