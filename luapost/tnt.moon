--  tnt.moon
require "lib.lib0"
require "lib.lib1"

config = {
  xwing: {
    custom_proc_title: "xwing",
    listen: 3301,
    work_dir: "/Users/leesangmin/tmp",
    slab_alloc_arena: 0.2,             --  200 MB
  }
  macmini: {
    custom_proc_title: "macmini",
    listen: 3302,
    work_dir: "/Users/soyul/tmp",
    slab_alloc_arena: 0.4,             --  400 MB
  }
}

--  initialize Tarantool.
box.cfg config.macmini

