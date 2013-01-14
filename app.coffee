express = require 'express'
config = require('./config').config
track = require './lib/track'

app = exports.app = express()

app.get '/', track.index
app.get '/_.js', track.js
app.get '/_.gif', track.img
app.get '*', (req, res) ->
  res.send '404', 404

app.listen config.http.port
console.log 'Tracking app started at http://0.0.0.0:' + config.http.port