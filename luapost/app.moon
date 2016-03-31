lapis = require "lapis"

--
--  web app 초기 진입
--
class App extends lapis.Application
  layout: require "views.layout"
  "/": =>
    -- "Welcome to Lapis #{require "lapis.version"}!"
    @html ->
      h1 class: "header", "Hello"
      div class: "body", ->
        text "안녕 to Lapis #{require "lapis.version"}!"

g_app = App

GET = (path,fn) -> g_app\get path,fn
POST = (path,fn) -> g_app\post path,fn
MATCH = (path,fn) -> g_app\match path,fn

_G["GET"] = GET
_G["POST"] = POST
_G["MATCH"] = MATCH

return g_app
