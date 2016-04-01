lapis = require "lapis"
html = require "lapis.html"
db = require "lapis.db"

class extends html.Widget
  content: =>
    h1 "XXX "..ROOTDIR
    h2 "Test tt02 table iteration"
    res = db.query "SELECT * FROM tt02"
    p type(res)
    for k,v in pairs res
      p k
      p type(v)
      for k2,v2 in pairs v
        p k2
        p v2
