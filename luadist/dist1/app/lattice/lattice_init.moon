--  lattice init.moon

print "lattice C compiler"

require "cjson"
term = require "term"

-- import term from "term"
colors = term.colors

ansi = (...)->
  sf(...)

print colors.reset
print "This is "..colors.red.."RED"..colors.reset.." text"
psf "This is %sRED%s text.",colors.red,colors.reset
psf "This is %s text.",colors.red "RED"

psf "This is %s text.",colors.red..colors.onwhite.."АјАн"..colors.reset
