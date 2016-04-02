config = require "lapis.config"

sessions_key = "lordofbastards"
secret_key = "lureofthetemptress"


--  common configures
config { "development", "test", "production", "staging" }, ->
  app_name "Lua Post"
  redis_host "127.0.0.1"
  redis_port 6379
  tool_version "1.0.0"
  pcall -> include require "secret.init"
  postgres {
    backend: "pgmoon"
    host: "127.0.0.1"
    user: "smlee"
    password: "smlee"
    database: "luapost"
  }


--  development
config "development", ->
  session_name sessions_key
  secret secret_key

--  test
config "test", ->
  code_cache "on"
  postgres {
    database: "luapost_test"
  }

--  production
config { "production", "staging" }, ->
  port 80
  num_workers 2
  code_cache "on"
  session_name sessions_key
  secret secret_key
  admin_email "movablecode@gmail.com"

--  staging
config "staging", ->
  port 8081
  num_workers 1
  daemon "off"
  notice_log "stderr"
