html = require "lapis.html"

class DefaultLayout extends html.Widget
  content: =>
    html_5 lang:"ko", ->
      head ->
        meta charset:"UTF-8"
        meta ["http-equiv"]:"X-UA-Compatible",content:"IE=edge"
        meta name:"description",content:"Introducing Lollipop, a sweet new take on Android."
        meta name:"viewport",content:"width=device-width, initial-scale=1.0, minimum-scale=1.0"
        title @title or "루아 포스트 Lua Post"
        --  material design lite
        link rel:"stylesheet",href:"https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=ko"
        link rel:"stylesheet",href:"https://fonts.googleapis.com/icon?family=Material+Icons"
        link rel:"stylesheet",href:"/s/app.css"
        script src:"/s/material.min.js"
        -- link rel:"stylesheet",href:"https://fonts.googleapis.com/icon?family=Material+Icons"

        --  scripts
        script type:"text/javascript",src:"/s/system.js"
        script type:"text/javascript",src:"/s/vendor.js"
        script type:"text/javascript",src:"/s/app.js"
        script ->
          raw [[
            require('initialize');
            var RD = require('react-dom');
            var R = require('react');

          ]]
      body ->
        @content_for "inner"
