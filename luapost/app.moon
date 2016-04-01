lapis = require "lapis"

--
--  web app 초기 진입 (대문)
--
g_app = require "views.main"

GET = (path,fn) -> g_app\get path,fn
POST = (path,fn) -> g_app\post path,fn
MATCH = (path,fn) -> g_app\match path,fn
ROOTDIR = "/home/smlee/Work/sexp/luapost"

_G["GET"] = GET
_G["POST"] = POST
_G["MATCH"] = MATCH
_G["ROOTDIR"] = ROOTDIR


--  load views
lfs = require "lfs"
load_pages = (fpath,subpath) ->
  skip=0
  fpath = fpath.."/"..subpath
  subpath2,fn = subpath.."."
  for fn in lfs.dir(fpath) do
    f1 = fn\sub 1,1
    if ((fn==".") or (fn=="..") or (f1=="."))
      skip += 1
    else
      fname = fpath.."/"..fn
      attr = lfs.attributes fname
      mode = attr.mode
      if (fn\sub(-4)==".lua")
        va = fn\sub(1,(#fn-4))
        require(subpath2..va)

load_pages ROOTDIR,"views"     --  load from './views'

return g_app
