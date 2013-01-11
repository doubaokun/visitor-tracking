fs = require 'fs'
useragent = require './useragent'
config = require('../config').config

imgbin = new Buffer "47494638396101000100800000dbdfef00000021f" +
  "90401000000002c00000000010001000002024401003b", 'hex'

jsContent = "document.write('<img src=\"/_.gif?l=' + " +
  "encodeURIComponent(window.location.href) + '&r=' + " +
  "encodeURIComponent(window.document.referrer || 'n/a') +'\" />');"

genLog = (req) ->
  ip = req.header('x-forwarded-for') || req.connection.remoteAddress
  ua = useragent.parse req.headers['user-agent']
  [location, referrer] = [req.query.l, req.query.r]

  logRec = 
    'location': location
    'referrer': referrer
    'platform': ua.platform.name
    'browser': ua.browser.name
    'ip': ip

  #console.log JSON.stringify(logRec) + "\n"
  fs.appendFile config.log.location, JSON.stringify(logRec) + "\n"

exports.img = (req, res) ->
  res.removeHeader "X-Powered-By"
  res.header "Content-Type", "image/gif"
  res.end imgbin, 'binary'
  genLog req

exports.js = (req, res) ->
  res.send jsContent

exports.index = (req, res) ->
  res.send """<html>
    <body>
    <script type="text/javascript" src="/_.js"></script>
    </body>
    </html>
    """