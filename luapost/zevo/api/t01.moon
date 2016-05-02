lapis = require "lapis"
html = require "lapis.html"

MATCH "/t01", =>
    @html ->
      h1 class: "header", "API T01 match"
GET "/t01", =>
    @html ->
      h1 class: "header", "API T01"

GET "/t02", =>
  {json:{epoll:"KATANA"}}

