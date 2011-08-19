(function() {
  var app, express, io, stylus;
  express = require('express');
  io = require('socket.io');
  stylus = require('stylus');
  app = module.exports = express.createServer();
  app.configure(function() {
    app.set('port', process.env.PORT || 3000);
    app.set('views', __dirname + '/views');
    app.set('view engine', 'jade');
    app.use(express.bodyParser());
    app.use(express.methodOverride());
    app.use(stylus.middleware({
      src: __dirname + '/public'
    }));
    app.use(app.router);
    return app.use(express.static(__dirname + '/public'));
  });
  app.configure('development', function() {
    return app.use(express.errorHandler({
      dumpExceptions: true,
      showStack: true
    }));
  });
  app.configure('production', function() {
    return app.use(express.errorHandler());
  });
  app.get('/', function(req, res) {
    return res.render('index', {
      title: 'Node App'
    });
  });
  app.listen(app.settings.port);
  io = io.listen(app);
  io.configure(function() {
    io.set("transports", ["xhr-polling"]);
    return io.set("polling duration", 10);
  });
  io.sockets.on('connection', function(socket) {
    console.log("connected");
    return io.sockets.send("Lorem Ipsum");
  });
}).call(this);
