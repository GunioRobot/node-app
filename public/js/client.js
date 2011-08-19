(function() {
  jQuery(function() {
    soundManager.url = '/swfs/';
    soundManager.flashVersion = 9;
    soundManager.useFlashBlock = false;
    soundManager.useHighPerformance = true;
    soundManager.wmode = 'transparent';
    soundManager.useFastPolling = true;
    return soundManager.onready(function() {
      var socket;
      socket = io.connect();
      return socket.on('message', function(data) {
        return console.log(data);
      });
    });
  });
}).call(this);
