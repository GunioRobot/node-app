# Require Node Packages

express = require 'express'
stylus  = require 'stylus'

# Configure Express App

app = module.exports = express.createServer()

app.configure ->
  app.set 'port', process.env.PORT || 3000
  app.set 'views', __dirname + '/views'
  app.set 'view engine', 'jade'
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use app.router
  app.use express.static __dirname + '/public'
  app.use require('connect-assets') buildFilenamer: (filename) -> filename
  
app.configure 'development', () ->
  app.use express.errorHandler dumpExceptions: true, showStack: true
  
app.configure 'production', () ->
  app.use express.errorHandler()
  
# Declare Express Routing & Listen
  
app.get '/', (req, res) -> res.render 'index', title: 'Test'
  
app.listen app.settings.port
