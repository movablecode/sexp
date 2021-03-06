lapis = require "lapis"
require "lib.lib0"
import load_pages from require "lib.lib1"

--
--  web app 초기 진입 (대문)
--
ROOTDIR = "/home/smlee/Work/sexp/luapost/zevo"
package.path = package.path..";"..ROOTDIR.."/?.lua"

g_app = (require "zv.main")!
GET = (path,fn) -> g_app\get path,fn
POST = (path,fn) -> g_app\post path,fn
MATCH = (path,fn) -> g_app\match path,fn

_G["GET"] = GET
_G["POST"] = POST
_G["MATCH"] = MATCH
_G["ROOTDIR"] = ROOTDIR

load_pages ROOTDIR,"api"     --  load from './zevo/api'
load_pages ROOTDIR,"page"    --  load from './zevo/page'

return g_app
