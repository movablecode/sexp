html = require "lapis.html"

class DefaultLayout extends html.Widget
  content: =>
    html_5 lang:"ko", ->
      head ->
        meta charset:"UTF-8"
        title @title or "Lapis Page 2"
        --  material design lite
        link rel:"stylesheet",href:"/s/app.css"
        script src:"/s/material.min.js"
        link rel:"stylesheet",href:"https://fonts.googleapis.com/icon?family=Material+Icons"
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
