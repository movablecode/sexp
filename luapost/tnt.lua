require("lib.lib0")
require("lib.lib1")
local config = {
  xwing = {
    custom_proc_title = "xwing",
    listen = 3301,
    work_dir = "/Users/leesangmin/tmp",
    slab_alloc_arena = 0.2
  },
  macmini = {
    custom_proc_title = "macmini",
    listen = 3302,
    work_dir = "/Users/soyul/tmp",
    slab_alloc_arena = 0.4
  }
}
return box.cfg(config.macmini)
