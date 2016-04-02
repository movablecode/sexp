lapis = require "lapis"
html = require "lapis.html"
db = require "lapis.db"
config = require "lapis.config"

tnt = require 'resty.tarantool'

class extends html.Widget
  content: =>
    act = @params.act or "def"
    h1 act
    lfn = {
      add: ->
        h3 "OK this is ADD"
      def: ->
        h2 tostring config.session_name
        h2 "Test tt02 table iteration"
        res = db.query "SELECT * FROM tt02"
        p type(res)
        for k,v in pairs res
          p k
          p type(v)
          for k2,v2 in pairs v
            p k2
            p v2
      test1: ->
        TestLog = require "models.TestLog"
        h3 sf "OK this is TEST1: %s",tostring(TestLog)
      tnt01: ->
        p type tnt
        p tostring tnt
        p tostring tnt.new
        tar, err = tnt\new {
          host: '127.0.0.1'
          port: 3301
          user: 'guest'
          -- password: 'some_password'
          socket_timeout: 2000
        }
        tar\connect!
        p tar\ping!
    }
    fn = lfn[act]
    fn! if fn
