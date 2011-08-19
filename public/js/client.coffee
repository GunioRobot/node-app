jQuery ->
  
  soundManager.url = '/swfs/'
  soundManager.flashVersion = 9
  soundManager.useFlashBlock = false
  soundManager.useHighPerformance = true
  soundManager.wmode = 'transparent'
  soundManager.useFastPolling = true

  soundManager.onready ->
  
    socket = io.connect()

    socket.on 'message', (data) ->
      console.log data
    