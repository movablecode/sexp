--  base0.lua
local cl = io.popen"cd":read'*l'

sf = string.format
local function write_format(...)
  io.write(sf(...))
end
local function write_format_flush(...)
  io.write(sf(...))
  io.flush()
end
wsf = write_format
wsff = write_format_flush
psf = function (...)
  print(sf(...))
end


SCRDIR = sf("%s\\scr0",cl)
APPDIR = sf("%s\\app",cl)

local a = sf("%s\\share\\lua\\5.1",cl)
package.path = sf(".\\?.lua;%s\\?.lua;%s\\?.lua;%s\\?.luac;%s\\?\\init.lua",
    SCRDIR,a,a,a)
a = sf("%s\\lib\\lua\\5.1",cl)
package.cpath = sf(".\\?.dll;%s\\?.dll;%s\\?.dll;",
    a,a,a)

local lfs = require "lfs"
require "oldbase"

local fn = {
  --  do embedded script
  e = function ()
    local item = pop_head(arg)
    execl_script (item, 1)
  end,
  --  app
  app = function ()
    local item = pop_head(arg)
    lfs.chdir("app/"..item)
    execl_script (item.."_init.moon")
  end,
  --  do file script
  f = function ()
    print ("called f")
  end,
  --  print env
  p = function ()
    print ("----")
    print ("path = ",package.path)
    print ("cpath = ",package.cpath)
    print ("----")
  end,
  --  test libraries
  test_lib = function ()
    require "ansicolors"
    print ("done")
  end,
  --  unit test
  test_unit = function ()
    -- require "busted.runner"()
    require 'busted.runner'({ standalone = false, batch = true })
  end,
}
if (#arg>0) then
  local first = pop_head(arg)
  local f = fn[first]
  if (type(f)=="function") then
    f ()
  elseif (type(first)=="string") then
    execl_script (first)
    print (arg,#arg)
  end
end
