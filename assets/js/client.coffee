#= require jquery.min
#= require soundmanager2

jQuery ->
  
  soundManager.url = '/swfs/'
  soundManager.flashVersion = 9
  soundManager.useFlashBlock = false
  soundManager.useHighPerformance = true
  soundManager.wmode = 'transparent'
  soundManager.useFastPolling = true
  
  soundManager.onready ->
    console.log "cool"
