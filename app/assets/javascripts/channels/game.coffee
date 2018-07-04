#= require jquery3
App.game = App.cable.subscriptions.create "GameChannel",
  collection: -> $("[data-channel='game']")

  connected: ->
    setTimeout =>
      @joinRoom()
    , 250

  disconnected: ->
    @perform 'leave_room', game_id: @gameId()

  received: (data) ->

  joinRoom: ->
    if @gameId
      @perform 'join', game_id: @gameId()
    else
      @perform 'leave_room'

  make_move: (move, turn) ->
    @perform 'make_move', move:move, game_id:@gameId(), turn:turn

  resetGame: ->
    @perform 'reset_game', game_id: @gameId()

  gameId: ->
    @collection().data('game-id')
