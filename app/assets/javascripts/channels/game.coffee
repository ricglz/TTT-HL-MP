#= require jquery3
App.game = App.cable.subscriptions.create "GameChannel",
  collection: -> $("[data-channel='game']")

  connected: ->
    setTimeout =>
      @joinRoom()
    , 1000

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log('llegan datos')

  joinRoom: ->
    if @gameId
      @perform 'join', game_id: @gameId()
    else
      @perform 'leaveRoom'

  make_move: (data) ->
    @perform 'make_move', move:data, game_id:@gameId()

  gameId: ->
    @collection().data('game-id')
