--  tnt.lua

--  tarantool settings

box.cfg{
  custom_proc_title = "xwing",
  listen = 3301,
  work_dir = "/home/smlee/tmp",
  slab_alloc_arena = 0.1,             --  100 MB
}

--  allow guest operations
-- box.schema.user.grant('guest', 'read,write,execute', 'universe')

