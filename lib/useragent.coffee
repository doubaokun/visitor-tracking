exports.parse = parse = (uaStr) ->
  agent =
    platform: {}
    browser: {}

  ua = uaStr
  p = agent.platform
  b = agent.browser

  if /Windows/.test(ua)
    p.name = 'win'
    p.win = true
  else if /Mac/.test(ua)
    p.name = 'mac'
    p.mac = true
  else if /Linux/.test(ua)
    p.name = 'linux'
    p.linux = true
  else if /iPhone|iPod/.test(ua)
    p.name = 'iphone'
    p.iphone = true
  else if /iPad/.test(ua)
    p.name = 'ipad'
    p.ipad = true
  else if /Android/.test(ua)
    p.name = 'android'
    p.android = true
  else
    p.name = 'other'
    p.unknown = true

  if /MSIE/.test(ua)
    b.name = 'msie'
    b.msie = true
  else if /Firefox/.test(ua)
    b.name = 'firefox'
    b.firefox = true
  else if /Chrome/.test(ua)
    b.name = 'chrome'
    b.chrome = true
  else if /Safari/.test(ua)
    b.name = 'safari'
    b.safari = true
  else if /Opera/.test(ua)
    b.name = 'opera'
    b.opera = true
  else
    b.name = 'other'
    b.unknown = true

  if b.msie
    b.version = /MSIE (\d+(\.\d+)*)/.exec(ua)[1]
  else if b.firefox
    b.version = /Firefox\/(\d+(\.\d+)*)/.exec(ua)[1]
  else if b.chrome
    b.version = /Chrome\/(\d+(\.\d+)*)/.exec(ua)[1]
  else if b.safari
    b.version = /Version\/(\d+(\.\d+)*)/.exec(ua)[1]
  else if b.opera
    b.version = /Version\/(\d+(\.\d+)*)/.exec(ua)[1]
  else
    b.version = 0

  agent