express = require 'express'
path = require 'path'
favicon = require 'serve-favicon'
logger = require 'morgan'
cookieParser = require 'cookie-parser'
bodyParser = require 'body-parser'
fs = require 'fs'

# routes = require './routes/index'
# users = require './routes/users'


app = express()

# view engine setup
app.set 'views', path.join __dirname, 'views'
app.set 'view engine', 'jade'

# uncomment after placing your favicon in /public
# app.use favicon "#{__dirname}/public/favicon.ico"
app.use logger 'dev'
app.use bodyParser.json()
app.use bodyParser.urlencoded
  extended: false
app.use cookieParser()
app.use express.static path.join __dirname, 'public'

print = console.log

# Load-Up pages with router
dive_root_dir = './routes'
dive = (dir, action)->
  list = fs.readdirSync dir
  list.forEach (file)->
    path = dir + "/" + file
    stat = fs.statSync path
    # print stat
    if (stat and stat.isDirectory())
      dive path, action
    else
      # Call the action
      # action(null, path);
      kk = path.split('.')
      if (kk.length>2)
        kk2 = kk[1].split('/')
        req_name = "."+kk[1]
        route_name = req_name.slice dive_root_dir.length
        res = require req_name
        app.use route_name, res
        # print kk2, req_name, route_name

      print path,kk.length,kk

dive dive_root_dir

# root route
routes = require './routes/index'
app.use '/', routes

# users = require './routes/users'
# app.use '/users', users

if typeof asdf==undefined
  print "asdf Undefined!"


# catch 404 and forward to error handler
app.use (req, res, next) ->
    err = new Error 'Not Found'
    err.status = 404
    next err

# error handlers

# development error handler
# will print stacktrace
if app.get('env') is 'development'
    app.use (err, req, res, next) ->
        res.status err.status or 500
        res.render 'error',
            message: err.message,
            error: err

# production error handler
# no stacktraces leaked to user
app.use (err, req, res, next) ->
    res.status err.status or 500
    res.render 'error',
        message: err.message,
        error: {}

module.exports = app
