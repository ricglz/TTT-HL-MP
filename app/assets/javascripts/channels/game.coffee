#= require jquery3
App.game = App.cable.subscriptions.create "GameChannel",
  collection: -> $("[data-channel='game']")

  connected: ->

  disconnected: ->
    @perform 'leave_room', game_id: @gameId()

  received: (data) ->

  joinRoom: ->
    @perform 'join', game_id: @gameId()

  make_move: (move, turn) ->
    @perform 'make_move', move:move, game_id:@gameId(), turn:turn

  resetGame: ->
    @perform 'reset_game', game_id: @gameId()

  gameId: ->
    @collection().data('game-id')
