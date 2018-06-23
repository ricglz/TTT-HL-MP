#= require jquery3
App.game = App.cable.subscriptions.create "GameChannel",
  connected: ->
    console.log("Connected")

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log('llega received')
    console.log(data)

  make_move: (data) ->
    console.log('llega move')
    console.log(data)
    @perform 'make_move', move:data
