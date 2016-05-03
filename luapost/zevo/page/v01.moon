lapis = require "lapis"
html = require "lapis.html"

GET "/v/t01", =>
    @html ->
      h1 class: "header", "View T01"
GET "/v/t02", =>
  {json:{epoll:"View T02"}}

