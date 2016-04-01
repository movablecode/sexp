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

  "/xxx": =>
    render: "xxx"
