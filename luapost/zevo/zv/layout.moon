html = require "lapis.html"

class DefaultLayout extends html.Widget
  content: =>
    html_5 lang:"ko", ->
      head ->
        meta charset:"UTF-8"
        meta ["http-equiv"]:"X-UA-Compatible",content:"IE=edge"
        meta name:"description",content:"Introducing Lollipop, a sweet new take on Android."
        meta name:"viewport",content:"width=device-width, initial-scale=1.0, minimum-scale=1.0"
        title @title or "제보 온라인"
        --  favicon
        link rel:"shortcut icon",href:"/favicon.ico"
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
        -- Always shows a header, even in smaller screens.
        div class:"mdl-layout mdl-js-layout mdl-layout--fixed-header", ->
          header class:"mdl-layout__header",->
            div class:"mdl-layout__header-row",->
              -- <!-- Title -->
              span class:"mdl-layout-title","제보 온라인"
              -- <!-- Add spacer, to align navigation to the right -->
              div class:"mdl-layout-spacer"
              --  search bar
              div class:"mdl-textfield mdl-js-textfield mdl-textfield--expandable mdl-textfield--floating-label mdl-textfield--align-right", ->
                label class:"mdl-button mdl-js-button mdl-button--icon", for:"waterfall-exp", ->
                  i class:"material-icons", "search"
                div class:"mdl-textfield__expandable-holder", ->
                  input class:"mdl-textfield__input",["type"]:"text",name:"sample",id:"waterfall-exp"
              -- div class:"mdl-layout-spacer"
              -- <!-- Navigation. We hide it in small screens. -->
              nav class:"mdl-navigation mdl-layout--large-screen-only",->
                a class:"mdl-navigation__link", href:"",->
                  i class:"material-icons", "create"
                a class:"mdl-navigation__link", href:"", "전체"
                a class:"mdl-navigation__link", href:"", "핫이슈"
                a class:"mdl-navigation__link", href:"", "오늘"
                a class:"mdl-navigation__link", href:"", "분류"
          div class:"mdl-layout__drawer", ->
            span class:"mdl-layout-title", "제보"
            nav class:"mdl-navigation", ->
              a class:"mdl-navigation__link", href:"", "전체"
              a class:"mdl-navigation__link", href:"", "Link2"
              a class:"mdl-navigation__link", href:"", "Link3"
              a class:"mdl-navigation__link", href:"", "Link4"
          main class:"mdl-layout__content",->
            div class:"page-content",->
              @content_for "inner"

