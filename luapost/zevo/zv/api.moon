lapis = require "lapis"
html = require "lapis.html"

--  기본 routing rules
class extends lapis.Application
  views_prefix: "zv"
  -- layout: require "zv.layout"

  "/": =>
    @html ->
      h1 class: "header", "ZEVO Online API"
      -- div class: "body", ->
      --   text "안녕 제보 온라인이야 #{require "lapis.version"}!"
      -- button class:"mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent", "버튼"

  -- --  for TEST
  -- "/tt1": => render: "tt1"
  -- "/tt1/:act": => render: "tt1"
  -- "/x2/*": =>
  --   @html ->
  --     splat = @params.splat
  --     h1 type(splat)
  --     h1 #splat
  --     h1 splat
  --     -- for k,v in pairs(splat)
  --     --   print v
