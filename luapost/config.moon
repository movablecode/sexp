config = require "lapis.config"

--  development
config "development", ->
  postgres ->
    host "127.0.0.1"
    user "smlee"
    password "smlee"
    database "luapost"

--  production
config "production", ->
  port 80
  num_workers 2
  code_cache "on"
  postgres ->
    host "127.0.0.1"
    user "smlee"
    password "smlee"
    database "luapost"
