--  mba.moon
require "lib.lib0"
require "lib.lib1"
require "lib.tmodel"

-- (require "busted.runner")!

box.cfg {
  custom_proc_title: "osx_mba",
  listen: 3301,
  work_dir: "/Users/leesangmin/tmp/mba",
  slab_alloc_arena: 0.4,
}

-- describe "Test Set Starts...",->
--   it "Step 1",->
--     assert true
--     print "Katana"
