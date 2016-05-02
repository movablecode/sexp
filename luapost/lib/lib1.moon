--  lib1.moon

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
      ext = fn\sub(-4)
      if (ext==".lua")
        va = fn\sub(1,(#fn-4))
        require(subpath2..va)
      elseif (ext=="moon")
        va = fn\sub(1,(#fn-5))
        -- require(subpath2..va)

return {
  :load_pages
}
