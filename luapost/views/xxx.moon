lapis = require "lapis"
html = require "lapis.html"
db = require "lapis.db"

class extends html.Widget
  content: =>
    h1 "XXX "..ROOTDIR
    res = db.query "SELECT * FROM tt01"
