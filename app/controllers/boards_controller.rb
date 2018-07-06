# frozen_string_literal: true

# Class that controls the board model
class BoardsController < ApplicationController
  def show
    redirect_to log_in_path unless logged_in?
    @board = Board.find(params[:id])
    redirect_to root_path if @board.nil?
    @board.guest = current_user.username unless host?(@board)
    @board.save
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

  private

  def host?(board)
    current_user.username == board.host
  end
end
