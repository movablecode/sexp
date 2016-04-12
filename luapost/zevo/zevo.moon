lapis = require "lapis"
require "lib.lib0"
import load_pages from require "lib.lib1"

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

load_pages ROOTDIR,"views"     --  load from './views'

return g_app
