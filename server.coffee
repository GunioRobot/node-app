# Require Node Packages

express = require 'express'
io      = require 'socket.io'
stylus  = require 'stylus'

# Configure Express App

app = module.exports = express.createServer()

app.configure ->
  app.set 'port', process.env.PORT || 3000
  app.set 'views', __dirname + '/views'
  app.set 'view engine', 'jade'
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use stylus.middleware src: __dirname + '/public'
  app.use app.router
  app.use express.static __dirname + '/public'
  
app.configure 'development', () ->
  app.use express.errorHandler dumpExceptions: true, showStack: true
  
app.configure 'production', () ->
  app.use express.errorHandler()
  
# Declare Express Routing & Listen
  
app.get '/', (req, res) -> res.render 'index', title: 'Node App'
  
app.listen app.settings.port

# Listen to the App with Socket.io & Configure for Heroku

io = io.listen app

io.configure ->
  io.set "transports", ["xhr-polling"]
  io.set "polling duration", 10

# Socket Connection Function
  
io.sockets.on 'connection', (socket) ->
  console.log "connected"
  io.sockets.send "Lorem Ipsum"
