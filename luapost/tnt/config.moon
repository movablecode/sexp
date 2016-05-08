--  config.moon
require "lib.lib0"
require "lib.lib1"

config = {

  --  for vultr server
  blz1: {
    custom_proc_title: "blz1"
    listen: 3301
    work_dir: "/home/smlee/db/blz1"
    slab_alloc_arena: 0.1
  }
  blz2: {
    custom_proc_title: "blz2"
    listen: 3302
    work_dir: "/home/smlee/db/blz2"
    slab_alloc_arena: 0.1
  }
  tst1: {
    custom_proc_title: "tst1"
    listen: 3311
    work_dir: "/home/smlee/db/tst1"
    slab_alloc_arena: 0.1
  }

  --  for mac book air
  mba1: {
    custom_proc_title: "mba1"
    listen: 3301
    work_dir: "/Users/leesangmin/tmp/mba_1"
    slab_alloc_arena: 0.4
  }

  --  for mac mini
  mmn1: {
    custom_proc_title: "macmini",
    listen: 3301,
    work_dir: "/Users/soyul/tmp/db/macmini_1",
    slab_alloc_arena: 0.4,             --  400 MB
  }

}

return config
