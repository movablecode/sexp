html = require "lapis.html"

class DefaultLayout extends html.Widget
  content: =>
    html_5 lang:"ko", ->
      head ->
        meta charset:"UTF-8"
        title @title or "Lapis Page 2"
        -- script type:"text/javascript",src:"/s/test02.js"
        script type:"text/javascript",src:"/s/system.js"
        script type:"text/javascript",src:"/s/vendor.js"
        script type:"text/javascript",src:"/s/app.js"
        script ->
          raw [[
            require('initialize');
          ]]
      body ->
        @content_for "inner"
