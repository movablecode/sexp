lapis = require "lapis"
html = require "lapis.html"

--  기본 routing rules
class extends lapis.Application
  layout: require "views.layout"

  "/": =>
    @html ->
      h1 class: "header", "Hello"
      div class: "body", ->
        text "안녕 to Lapis #{require "lapis.version"}!"
      button class:"mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent", "버튼"

  --  for TEST
  "/xxx": => render: "xxx"
  "/x1/:act": => render: "xxx"
  "/x2/*": =>
    @html ->
      splat = @params.splat
      h1 type(splat)
      h1 #splat
      h1 splat
      -- for k,v in pairs(splat)
      --   print v
