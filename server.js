(function() {
  var app, express, stylus;
  express = require('express');
  stylus = require('stylus');
  app = module.exports = express.createServer();
  app.configure(function() {
    app.set('port', process.env.PORT || 3000);
    app.set('views', __dirname + '/views');
    app.set('view engine', 'jade');
    app.use(express.bodyParser());
    app.use(express.methodOverride());
    app.use(app.router);
    app.use(express.static(__dirname + '/public'));
    return app.use(require('connect-assets')({
      buildFilenamer: function(filename) {
        return filename;
      }
    }));
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
      title: 'Test'
    });
  });
  app.listen(app.settings.port);
}).call(this);
