lapis = require "lapis"
html = require "lapis.html"

MATCH "/api/t01", =>
    @html ->
      h1 class: "header", "API T01 match"
GET "/api/t01", =>
    @html ->
      h1 class: "header", "API T01"

GET "/api/t02", =>
  {json:{epoll:"KATANA"}}

